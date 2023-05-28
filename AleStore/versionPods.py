try:
    writeList = []
    with open("Podfile") as file:
        for line in file:
            if line == "# platform :ios, '9.0'\n":
                line = line.replace(line, "platform :ios, '16.0'\n")
            writeList.append(line)
    print(writeList)
    with open("Podfile", "w") as fp:
        fp.writelines(writeList)
    
except FileNotFoundError:
    print("O arquivo não existe")
except:
    print("Aconteceu algo aqui!!!")