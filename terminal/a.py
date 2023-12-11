import random
import os

def main():
    a = random.randint(1, 3)

    if a == 1:
        os.system("neofetch")
    elif a == 2:
        os.system("pfetch")
    elif a == 3:
        os.system("colorscript random")

if __name__ == "__main__":
    main()
