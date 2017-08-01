%assuming 4 - 64 vcpu
function color = getVcpuColor(vcpu_num, nr_vcpu)  %only two vcpus
    if (vcpu_num == 1)
        color = [1 0 0];
    else
%         dev = 255/nr_vcpu;
%         color = [dev*(nr_vcpu-vcpu_num) 255-dev*vcpu_num dev*vcpu_num]/255;
        color = [0 0 1];
    end
end