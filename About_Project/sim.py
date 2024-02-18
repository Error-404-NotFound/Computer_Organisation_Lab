import matplotlib.pyplot as plt
import numpy as np

class Core:
    def __init__(self):
        self.registers = [0] * 32
        self.pc = 0
        self.program = []

    def execute(self,memory):
        parts = self.program[self.pc].split()
        opcode = parts[0]
        print(opcode)
        if opcode == "add":
            rd = int(parts[1][1:])
            rs1 = int(parts[2][1:])
            rs2 = int(parts[3][1:])
            self.registers[rd] = self.registers[rs1] + self.registers[rs2]
        elif opcode == "ld":
            rd = int(parts[1][1:])
            location = int(parts[2])
            self.registers[rd] = memory[location]
        self.pc += 1

class Procesor:
    def __init__(self):
        self.memory = [0] * 4096
        self.clock = 0
        self.cores = [Core(),Core()]

    def run(self):
        while self.clock < max([len(core.program) for core in self.cores]):
            for i in range(2):
                if self.clock < len(self.cores[i].program):
                    self.cores[i].execute(self.memory)
            self.clock += 1


sim = Procesor()
sim.cores[0].registers[2] = 8
sim.memory[5] = 18
for i in range(2):
    print(sim.cores[i].registers)
print("Before run")
sim.cores[0].program = ["add x1 x2 x3","ld x5 5"]
sim.cores[1].program = ["add x1 x2 x3","ld x5 5"]
sim.run()
for i in range(2):
    print(sim.cores[i].registers)

data = np.array([sim.cores[i].registers for i in range(2)])
plt.imshow(data, cmap='hot', interpolation='nearest')
for i in range(2):
    for j in range(32):
        plt.text(j,i,str(sim.cores[i].registers[j]),ha='center',va='center')
plt.show()