from manim import *

class Hello(Scene):
    def construct(self):
        text=Text("Hello world",font_size=144)
        self.add(text)

class CreateCircle(Scene):
    def construct(self):
        circle = Circle()  # create a circle
        circle.set_fill(RED, opacity=0.5)  # set the color and transparency
        #self.play(Create(circle))  # show the circle on screen
        #circle.rotate(PI / 4)

        square = Square()
        square.rotate(PI / 4)
        self.play(Create(square))
        self.play(Transform(square, circle))  # interpolate the square into the circle
        self.play(FadeOut(square))  # fade out animation

        sq = Square()
        sq.set_fill(BLUE,opacity=0.7)
        sq.next_to(circle,buff=0.5)
        self.play(Create(circle),Create(sq))
        self.play(sq.animate.set_fill(PINK,opacity=0.5))
        self.wait(1)
        self.play(sq.animate.shift(UP), run_time=3)


class NeuralNetworkScene(Scene):
    def construct(self):
        # Define the layers
        input_layer = [self.create_neuron() for _ in range(3)]
        hidden_layer = [self.create_neuron() for _ in range(4)]
        output_layer = [self.create_neuron() for _ in range(2)]
        
        # Position the layers
        self.position_layer(input_layer, LEFT)
        self.position_layer(hidden_layer, ORIGIN)
        self.position_layer(output_layer, RIGHT)
        
        # Create edges between layers
        edges = self.connect_layers(input_layer, hidden_layer) + self.connect_layers(hidden_layer, output_layer)
        
        # Add neurons and edges to the scene
        self.play(Create(VGroup(*input_layer, *hidden_layer, *output_layer, *edges)))
        self.wait()
        
        # Animate the signals (forward pass)
        signal_animations = [self.animate_signal(edge) for edge in edges]
        self.play(*signal_animations)
        self.wait()
    
    def create_neuron(self, radius=0.2, color=BLUE):
        return Circle(radius=radius, color=color, fill_opacity=1)
    
    def position_layer(self, layer, center):
        for i, neuron in enumerate(layer):
            neuron.move_to(center + UP * (i - len(layer) / 2))
    
    def connect_layers(self, layer1, layer2):
        edges = []
        for neuron1 in layer1:
            for neuron2 in layer2:
                edge = Line(neuron1.get_center(), neuron2.get_center())
                edges.append(edge)
        return edges
    
    def animate_signal(self, edge):
        dot = Dot(color=YELLOW)
        dot.move_to(edge.get_start())
        return MoveAlongPath(dot, edge, rate_func=linear, run_time=2)

