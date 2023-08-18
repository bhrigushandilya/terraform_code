resource "aws_ebs_volume" "ebs_volume" {
    count = 2
    availability_zone = element(var.az,count.index)
    size = 5
    tags = {
      Name = "${var.env}-ebs-${count.index+1}"
    }
}

resource "aws_volume_attachment" "volume_attachment" {
    count = 2
    device_name = var.device_name[count.index]
    instance_id = var.instance_id[count.index]
    volume_id = aws_ebs_volume.ebs_volume[count.index].id
}