Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web10.1012.1579896034444574985
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 24 Jan 2020 12:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=ZhFdEsOC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.50, mailfrom: jdmason@kudzu.us)
Received: by mail-io1-f50.google.com with SMTP id x1so3192084iop.7
        for <meta-arm@lists.yoctoproject.org>; Fri, 24 Jan 2020 12:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=2NWZLcnVqY847tMKFMfuTTIp3pNSddCi1bAdidF2oto=;
        b=ZhFdEsOC6WauZij88F9I9VgL3IZEs4unLVIr/1R3NIKNvcqaK8zC0gkEtgBfhMzJkT
         owpUDJqjlMlZCbf5yNKE/x1fulnAgs6e0IXJ/MYlVnmvP2jQJYVG8HWlc0WM8vOdXUw9
         LPVleGkvDaLX1NvmDRALF1flhF68ZyhUFo493WOICfL2TSHQCLWKxC8hF4k4E7C+GESG
         X/j/5Qf67OFzYfNXF9EALk1u+2H2GUSP3616rmDsgfShPJKeMUqh/T2tfBiGoXH00KQH
         0Su7lH+Qzm4HVdgeNPyQKS72aWAPJDk9HWu4rKnF0QsYVgIZkC3JmUR4YiKpqP/HgYwR
         H5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=2NWZLcnVqY847tMKFMfuTTIp3pNSddCi1bAdidF2oto=;
        b=uZSENnQt/WqLtmtzcDh1MxKZNxEc8T+e3Q3nsBrLq4qMLCTkOJlcbtbF4nOwKoe1su
         CMc9tO4O5Fx/A08AGsBuoGYRpyimsi/fcK7OUzLR9+HMsfahz1+n441QOhczsaMWfVD8
         wRG5h7EE++nYCMX/O1J5D7gt2qEyf/ipjtEyufN2DKJ/zS4u2Sm5B0f1cZfa4mK/5mcU
         Vapc5qX48XADjhiIUBozO66xdGuQGUkoXfTBd90KiXv4mqVoe5eyrRYFEe6is9E/XlJG
         NAn7kSmvIBsqOUI68kM2RqZAhYoEFlsBLtCH+jmrktTBEzj3X21rS7ez5T/k5vy6oP/w
         Nt+w==
X-Gm-Message-State: APjAAAVNmJssTow6Z9RazblNT7NmSFi9r9zGcY557Ja3lxwVQkLwB1Dh
	aBJ/S7ug1nrXspoHXA8SGCqj3SFCgj7jKHocvHIe9kaRXyA=
X-Google-Smtp-Source: APXvYqxGEZpGZhigpISxDtpw+aCa9M6gTDZEopCXJLY2yeMBPkNvwkBxhdhqFxZ7PKqMkkDLc/6CFkpp3Acqzc2CuYY=
X-Received: by 2002:a02:3090:: with SMTP id q138mr3814962jaq.23.1579896033569;
 Fri, 24 Jan 2020 12:00:33 -0800 (PST)
MIME-Version: 1.0
References: <f328d6db-3432-7b9b-2981-3bb18aa0b857@arm.com> <31678.1579822941067769362@lists.yoctoproject.org>
In-Reply-To: <31678.1579822941067769362@lists.yoctoproject.org>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Fri, 24 Jan 2020 15:00:22 -0500
Message-ID: <CAPoiz9zOVCzYAJVxRx4Z-9-DkCJr3g1vOkPBHWhoSzJQYPrTOw@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm layer update
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2020 at 6:42 PM Denys Dmytriyenko <denis@denix.org> wrote:
>
> Hi, Jon,
>
> It is nice to finally and accidentally discover your secret lair, I mean=
 layer! :) I still blame myself for not paying close attention, but I googl=
ed over and over and still couldn't find any public announcements anywhere.=
.. Why is such a big secret? :)

The first rule about meta-arm is don't talk about meta-arm.  Wait,
that's fight club.  Nevermind...

meta-arm is still relatively new, but I need to do a better job about
publicizing it.  Thank you for pointing this out.

Thanks,
Jon

>
> --
> Denys
>
>
> On Tue, Jan 7, 2020 at 02:35 PM, Jon Mason wrote:
>
> The meta-arm layer is now publicly available at
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/
>
> It is still under active development, and I encourage everyone who would
> like to contribute to read
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/README.md
>
>
> Also, some of the layers are now present on the OpenEmbedded layer
> index. Specifically,
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm-b=
sp/
> http://layers.openembedded.org/layerindex/branch/master/layer/meta-arm/
>
> The meta-arm-iota layer was rejected due to not having a distro
> definition in it, and generally being empty. I will attempt to add it
> again once code has been pushed to that location.
>
>
> Thanks,
> Jon
> IMPORTANT NOTICE: The contents of this email and any attachments are con=
fidential and may also be privileged. If you are not the intended recipient=
, please notify the sender immediately and do not disclose the contents to =
any other person, use it for any purpose, or store or copy the information =
in any medium. Thank you.
>
>=20
