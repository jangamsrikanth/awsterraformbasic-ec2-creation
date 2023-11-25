resource "aws_instance" "web" {
  ami           = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"
  key_name   = "amazonlinux"
  associate_public_ip_address = true
    tags = {
    Name = "awsterrapra"
  }
  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("amazonlinux.pem")
    host = aws_instance.web.public_ip
  }
  provisioner "remote-exec" {
    inline = [  
       "sudo apt-get update", 
       "sudo apt-get install nginx -y",
       "sudo apt-get install zip -y" ,
       "sudo apt-get install unzip -y",
       "wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip",
       "sudo unzip mediplus-lite.zip",
       "sudo mv mediplus-lite /var/www/html"
    ]    
  }
}
