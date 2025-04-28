Return-Path: <marek.belisko@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C74FC36005
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 09:45:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.44305.1745833504411524539
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Apr 2025 02:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mx9I6Xya;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: marek.belisko@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ee5a5bb66so2839080f8f.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 28 Apr 2025 02:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745833502; x=1746438302; darn=lists.yoctoproject.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WYOj2O7l5nlLG86NO9N1m263Vn0bLDABAKERxKj1OFU=;
        b=mx9I6Xyabg1vbCd4/jxp/EFqLIN5NtwSPVKNcEX3MOgQ6Q5ExhVBkVVGgUB4n5ZykH
         TUjXwgI33ijoR9v7Ev9ujlXyoayvPHnp98QUNniljDX1ooJCwjfFT65kWF6sz8Q+QUj4
         KP/UDCTI2SpW2Rhz+B5RWNqw9l/tVtWi8CPUEuvrvshjlkX73pMvYp1kbzPG1YOQMOo5
         r9agRH1jhYON65rDcvyiGo+BgkIPCpKcKHTgJILMgLFNHCgfjjXSZ2xCzyh8BY8b7YT7
         cWtdPC2/5EKoNM6uL7Fz0N/yJkgq6h9SmKkf6OKXao1AqRZ7eL+T3YBLcvm3xuwGQsAY
         45Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745833502; x=1746438302;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WYOj2O7l5nlLG86NO9N1m263Vn0bLDABAKERxKj1OFU=;
        b=ebX1/61rKXEqbQ3n3pu0gHAXr25o0fwd4AD+a3LnujgZlXLRgcmylExAS/qFuqSwoX
         8dLUL23BdmiuLsXe6O6wqCx+WCl8Ebv93FhhADiKsgWwq2F/OMZFomGV0GNVUeFyRI6Y
         TlW7KjqUwaPvXWUlo41A1xxPwE3yTufKlOpGXhaRoROvLTam2PtVfn5LZ12u67b+kV+F
         0ofzXAqV3TE+gS3MOjeHzn8rGPNiT48mF9N+pDbBAIqzpl+1jBhOAmkRWvCWNHdJf7t7
         lneq2iGXcWkGl61rZHPtW3cqJ2YCIwPAWaflLwO6vnDHeDOpQZcWzewLruvH91oWODar
         cO7w==
X-Gm-Message-State: AOJu0Yz1NYfvdAdmn85gaHaXf/24rZ+RhBFoyy0UNX1RGZz7XtCgNNtQ
	zCgjQCYgYFINUgw6D4yt1CR34rugi/RyQBzb+ZJLTPuJj9SgUxEv7AhF4ZtDcj8sSmSJFQIr/DY
	txJuK50xVbfIGWkQrX1XZHKUSP6nBhgYGols=
X-Gm-Gg: ASbGncvmmZ3ywoStk46HZUMjf/7pXQmSKesRQ/JWbGZ7IEuQFW5WvuujWeuzS7SLcYh
	NkDrRsRHnHQidhdKiyHtW/KeDQbXkCKuuffI/mxhnKq6fSchhr82g/2K66krMfVRS09LMQOrqyl
	YUIiMGEQV2884BfyF3/qmDTg==
X-Google-Smtp-Source: AGHT+IGIz5WkcfzhVNVzIiExsA79Iv1BoulsBf+hzT5vey9KmWCDPyL2awuNWDXWR+sr7dz5c3tfq9J4t/Ln3bUHA0o=
X-Received: by 2002:a05:6000:40df:b0:3a0:7139:d176 with SMTP id
 ffacd0b85a97d-3a074e1e226mr7973281f8f.19.1745833502222; Mon, 28 Apr 2025
 02:45:02 -0700 (PDT)
MIME-Version: 1.0
From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 28 Apr 2025 11:44:50 +0200
X-Gm-Features: ATxdqUHJXwx-K-73DeKdzV3yus7lxOgpyi1oePnb6M9wj-IMsR0lHf6Mtpma5k0
Message-ID: <CAAfyv35MGsyiObfz3taVZSHR8ZSxL9KmaoyPfyN6EcYxD9Hhyw@mail.gmail.com>
Subject: walnasar LTO issues for sunxi
To: meta-arm@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000bcb2830633d3896e"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Apr 2025 09:45:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6481

--000000000000bcb2830633d3896e
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm trying to build a TFA for pine64-plus (sunxi 64 bit) using the walnasar
branch. I'm hitting following issues:

| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/plat_log_common.o:
plugin needed to handle lto object
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/plat_log_common.o:
plugin needed to handle lto object
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/plat_psci_common.o:
plugin needed to handle lto object
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/plat_psci_common.o:
plugin needed to handle lto object
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/arm_arch_svc_setup.o:
plugin needed to handle lto object
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/arm_arch_svc_setup.o:
plugin needed to handle lto object
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/std_svc_setup.o:
plugin needed to handle lto object
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/std_svc_setup.o:
plugin needed to handle lto object
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/bl31_entrypoint.o:
in function `bl31_entrypoint':
| (.text.asm.bl31_entrypoint+0x110): undefined reference to `bl31_setup'
| aarch64-poky-linux-ld: (.text.asm.bl31_entrypoint+0x114): undefined
reference to `bl31_main'
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/cpu_data.o:
in function `_cpu_data_by_index':
| (.text.asm._cpu_data_by_index+0x8): undefined reference to `percpu_data'
| aarch64-poky-linux-ld: (.text.asm._cpu_data_by_index+0xc): undefined
reference to `percpu_data'
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/context.o:
in function `end':
| (.text.asm.el3_exit+0x30): undefined reference to `per_world_context'
| aarch64-poky-linux-ld: (.text.asm.el3_exit+0x34): undefined reference to
`per_world_context'
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/runtime_exceptions.o:
in function `sync_handler64':
| (.text.asm.sync_exception_handler+0x68): undefined reference to
`rt_svc_descs_indices'
| aarch64-poky-linux-ld: (.text.asm.sync_exception_handler+0x6c): undefined
reference to `rt_svc_descs_indices'
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/runtime_exceptions.o:
in function `sysreg_handler64':
| (.text.asm.sync_exception_handler+0xa0): undefined reference to
`handle_sysreg_trap'
| aarch64-poky-linux-ld: (.text.asm.sync_exception_handler+0xd0): undefined
reference to `inject_undef64'
| aarch64-poky-linux-ld:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/runtime_exceptions.o:
in function `handle_interrupt_exception':
| (.text.asm.handle_interrupt_exception+0x20): undefined reference to
`plat_ic_get_pending_interrupt_type'
| aarch64-poky-linux-ld: (.text.asm.handle_interrupt_exception+0x2c):
undefined reference to `get_interrupt_type_handler'
| make: *** [Makefile:1557:
/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/bl31.elf]
Error 1
| make: Leaving directory
'/work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/git'
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.

With scarthgap it works. Am I doing something wrong?

Thanks and BR,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com

--000000000000bcb2830633d3896e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I&#39;m trying to build =
a TFA for=C2=A0pine64-plus (sunxi 64 bit) using the walnasar branch. I&#39;=
m hitting following issues:</div><div><br></div><div>| aarch64-poky-linux-l=
d: /work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/bu=
ild/sun50i_a64/release/bl31/plat_log_common.o: plugin needed to handle lto =
object<br>| aarch64-poky-linux-ld: /work/build/tmp/work/pine64_plus-poky-li=
nux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/plat_log_common=
.o: plugin needed to handle lto object<br>| aarch64-poky-linux-ld: /work/bu=
ild/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_=
a64/release/bl31/plat_psci_common.o: plugin needed to handle lto object<br>=
| aarch64-poky-linux-ld: /work/build/tmp/work/pine64_plus-poky-linux/truste=
d-firmware-a/2.12.1/build/sun50i_a64/release/bl31/plat_psci_common.o: plugi=
n needed to handle lto object<br>| aarch64-poky-linux-ld: /work/build/tmp/w=
ork/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/relea=
se/bl31/arm_arch_svc_setup.o: plugin needed to handle lto object<br>| aarch=
64-poky-linux-ld: /work/build/tmp/work/pine64_plus-poky-linux/trusted-firmw=
are-a/2.12.1/build/sun50i_a64/release/bl31/arm_arch_svc_setup.o: plugin nee=
ded to handle lto object<br>| aarch64-poky-linux-ld: /work/build/tmp/work/p=
ine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl=
31/std_svc_setup.o: plugin needed to handle lto object<br>| aarch64-poky-li=
nux-ld: /work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.12=
.1/build/sun50i_a64/release/bl31/std_svc_setup.o: plugin needed to handle l=
to object<br>| aarch64-poky-linux-ld: /work/build/tmp/work/pine64_plus-poky=
-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/bl31_entrypo=
int.o: in function `bl31_entrypoint&#39;:<br>| (.text.asm.bl31_entrypoint+0=
x110): undefined reference to `bl31_setup&#39;<br>| aarch64-poky-linux-ld: =
(.text.asm.bl31_entrypoint+0x114): undefined reference to `bl31_main&#39;<b=
r>| aarch64-poky-linux-ld: /work/build/tmp/work/pine64_plus-poky-linux/trus=
ted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/cpu_data.o: in function=
 `_cpu_data_by_index&#39;:<br>| (.text.asm._cpu_data_by_index+0x8): undefin=
ed reference to `percpu_data&#39;<br>| aarch64-poky-linux-ld: (.text.asm._c=
pu_data_by_index+0xc): undefined reference to `percpu_data&#39;<br>| aarch6=
4-poky-linux-ld: /work/build/tmp/work/pine64_plus-poky-linux/trusted-firmwa=
re-a/2.12.1/build/sun50i_a64/release/bl31/context.o: in function `end&#39;:=
<br>| (.text.asm.el3_exit+0x30): undefined reference to `per_world_context&=
#39;<br>| aarch64-poky-linux-ld: (.text.asm.el3_exit+0x34): undefined refer=
ence to `per_world_context&#39;<br>| aarch64-poky-linux-ld: /work/build/tmp=
/work/pine64_plus-poky-linux/trusted-firmware-a/2.12.1/build/sun50i_a64/rel=
ease/bl31/runtime_exceptions.o: in function `sync_handler64&#39;:<br>| (.te=
xt.asm.sync_exception_handler+0x68): undefined reference to `rt_svc_descs_i=
ndices&#39;<br>| aarch64-poky-linux-ld: (.text.asm.sync_exception_handler+0=
x6c): undefined reference to `rt_svc_descs_indices&#39;<br>| aarch64-poky-l=
inux-ld: /work/build/tmp/work/pine64_plus-poky-linux/trusted-firmware-a/2.1=
2.1/build/sun50i_a64/release/bl31/runtime_exceptions.o: in function `sysreg=
_handler64&#39;:<br>| (.text.asm.sync_exception_handler+0xa0): undefined re=
ference to `handle_sysreg_trap&#39;<br>| aarch64-poky-linux-ld: (.text.asm.=
sync_exception_handler+0xd0): undefined reference to `inject_undef64&#39;<b=
r>| aarch64-poky-linux-ld: /work/build/tmp/work/pine64_plus-poky-linux/trus=
ted-firmware-a/2.12.1/build/sun50i_a64/release/bl31/runtime_exceptions.o: i=
n function `handle_interrupt_exception&#39;:<br>| (.text.asm.handle_interru=
pt_exception+0x20): undefined reference to `plat_ic_get_pending_interrupt_t=
ype&#39;<br>| aarch64-poky-linux-ld: (.text.asm.handle_interrupt_exception+=
0x2c): undefined reference to `get_interrupt_type_handler&#39;<br>| make: *=
** [Makefile:1557: /work/build/tmp/work/pine64_plus-poky-linux/trusted-firm=
ware-a/2.12.1/build/sun50i_a64/release/bl31/bl31.elf] Error 1<br>| make: Le=
aving directory &#39;/work/build/tmp/work/pine64_plus-poky-linux/trusted-fi=
rmware-a/2.12.1/git&#39;<br>| ERROR: oe_runmake failed<br>| WARNING: exit c=
ode 1 from a shell command.<br></div><div><br></div><div>With scarthgap it =
works. Am I doing something wrong?</div><div><br></div><div>Thanks and BR,<=
/div><div><br></div><div>marek</div><div><br></div><span class=3D"gmail_sig=
nature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature">as simple and primitive as possible<br>----=
---------------------------------------------<br>Marek Belisko - OPEN-NANDR=
A<br>Freelance Developer<br><br>Ruska Nova Ves 219 | Presov, 08005 Slovak R=
epublic<br>Tel: +421 915 052 184<br>skype: marekwhite<br>twitter: #opennand=
ra<br>web: <a href=3D"http://open-nandra.com" target=3D"_blank">http://open=
-nandra.com</a></div></div>

--000000000000bcb2830633d3896e--

