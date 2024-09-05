// Backend용으로 할당한 EIP의 이름을 통해 EIP의 데이터를 가져온다
data "aws_eip" "back" {
    tags = {
        Name = var.elastic_ip_names["back"]
    }
}