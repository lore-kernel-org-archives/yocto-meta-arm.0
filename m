Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.4098.1620126222804609890
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 May 2021 04:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=hCdoLlEF;
 spf=pass (domain: burtonini.com, ip: 209.85.128.47, mailfrom: ross@burtonini.com)
Received: by mail-wm1-f47.google.com with SMTP id g65so5116877wmg.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 04 May 2021 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zS6/ZDCrlWG7kVySkUtaTYQtVw/KnSIec1Am3xsVmFY=;
        b=hCdoLlEFZiK7Kr8HbaqEcZaud7JZ1DNpaaL2ehTRGdl7scK8LJ6l88lUkCgBN8YANF
         z8so3fEXEnS4UqEoRUhN9pDcC0FxoUupKbSOHBIiuSFrs7GttqKgYnWZBwi0HHBtZvEn
         ElmpVkJ4vgxUbNaQs2qg+vr5T/JLFdGUunmLiMWaCUjxwDXLIo8NTosfXpbISG2cYcTg
         FQlVRrbB4kIzUFlJ0K61jh8RKpveO+QUHiBXWu36c/YPyiQAadpNVo+/xH3JHU2jeOig
         EqFTGLJul/0TpuNqPRqGrPQ0SkqXgZpNgob0xGPWAaO+SQci98BsvJiTgZiM4msPwy/f
         OGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zS6/ZDCrlWG7kVySkUtaTYQtVw/KnSIec1Am3xsVmFY=;
        b=Iquc6cPXadCI/3IaBZgHvsv9S4ysKCNHA3P73ItPTrRe1ORM7wgz+lV7BcAPPQLA8d
         mOfNR4Wa58ZFzrQfQlGXS2iHhlYqPTj4XIDqp43ZRWW8Xl/t/h2bC3RvSB7ZHnWqlwjO
         Un+axM9YvbQOBZ4zFzVrXoSuRt2on/tuTum2d4ICvjsHv/H7GnLxjfmgOeVdxSgcXB3v
         jYcSk+twq1ugl+TgD6ZDVUiXXfDIm7oxIltf/MeeoeiGYuAZyUM8xoXKYm2aD24D0HPJ
         PaNmKa7E3ZxExVohwkFXNziLBLq43ls3qmXTgfC2YvV1wjYKi2mCxzaJLk0S3o49ytYQ
         NFHA==
X-Gm-Message-State: AOAM5333EbVst+2EQklcLPttvZO1BpN5HFxC1exBTJ2Oqr3zNCgTi3aY
	NAWKJDsfISkmCiN1pbJ44CBi6TGQJGJ2EIr6uPxWog==
X-Google-Smtp-Source: ABdhPJz/THvaJfFHLZWvpgaQJ4AqNnRdzpJYu7H5xLTQk8ciGgXGARjr1LZ7ZXqYYmNOmKfN0+luwgviFxmhcaeBpZI=
X-Received: by 2002:a1c:9817:: with SMTP id a23mr14234795wme.171.1620126221286;
 Tue, 04 May 2021 04:03:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210501192641.GA20675@kudzu.us>
In-Reply-To: <20210501192641.GA20675@kudzu.us>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 4 May 2021 12:03:30 +0100
Message-ID: <CAAnfSTuvMo++ZZPyBYC2fXnOj6+eF3c-me8iXG+5iiLwZrCD+Q@mail.gmail.com>
Subject: Re: [meta-arm] meta-arm hardknott release
To: Jon Mason <jdmason@kudzu.us>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Woop woop!

On Sat, 1 May 2021 at 20:26, Jon Mason <jdmason@kudzu.us> wrote:
>
> meta-arm has released the hardknott support branch.  The branch was
> forked on Friday, 32 April from the master branch and was tagged as
> "3.3" yesterday.  The tag is GPG signed and my public key can be
> provided if someone wants to use it to verify.  Per the previous public
> discussion on this list, hardknott will only be taking bug fixes and be
> passively maintained (with dunfell being the actively supported LTS).
>
> Per an external request, we have duplicated all existing "numbers only"
> tags (i.e., 3.3) with a "yocto-x.y.z" tag (i.e., yocto-3.3).
>
> Thanks,
> Jon
>
> 
>
