Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web08.157.1619471245296842939
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Apr 2021 14:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Lm03qje/;
 spf=pass (domain: burtonini.com, ip: 209.85.221.54, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f54.google.com with SMTP id h15so5056686wre.11
        for <meta-arm@lists.yoctoproject.org>; Mon, 26 Apr 2021 14:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zW5FP86RAQWFBmw769qzA7VE5Cm82M2RvGaDPdgRg4s=;
        b=Lm03qje/xrO/OUKwTU7oehjsTEv3bCVX2EGBWwaIgFvu5PkLJsvwNyqMe6pYPmshUv
         NqjqjuWNx5OdmcQCYP36sI3kj9ZJRuaIDY6MfT4SV2T28s/qOitjkAaWLURXKYxLuKUW
         fDlRbMGVwHOaE/OzGZtPDn8Fk7vS3TryXOAT0JPz7zkCBiUaD+7hx3t6UyUD/e3Zb8yt
         PGPfTMK3+B47Z6FMyUyRcwaSQKYVsS2m9mZWuNxKALqe3BZFD9M7+sVT+JQJjxvRPWwC
         hxple0XIPCGXJiilDOv4locdCAMqYAnFOTsp89BddjVAlWVrVYvVgRr/Ho7JNdlL2QhO
         G1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zW5FP86RAQWFBmw769qzA7VE5Cm82M2RvGaDPdgRg4s=;
        b=iPjwzgQRrYnqExdINJ33jBtfLxZUv3shG+XEG3ZvJyYsFPien1ybvYdf2IB+Tu+nts
         tSyooUfFAt8lKzkNYWavPf9QvOi2ZPUUkskVCIoSZQmKCDG5whI5aWXLG3+xLijzOsSU
         bFDaWzP+AgfAcu3Xcf8jC2BmsbU0+VKQ6MTDjFreddkyOK0PPKhoDdKpk0H4aB0U4PvQ
         2S6nW7rGr8TthAqvPrgoXsEXPfxDI8s/IcX0l2keja2DmR2xKcAEuai7hhXXhD+sgM9Q
         kuWOlP3HXxdDfogWPR8UhSeIk4rxJ1uh/o0r4kjzyOo29vN+W58C/t7huwNnIQxupU6a
         bbVg==
X-Gm-Message-State: AOAM5337VOB9MPusdb/8WTuSw/p0OMuLfdrSBpatmvyhkNAoay6TupQs
	ZuqpBOp9zBdjtgygoblF+FbqkznLhJZLl2mSpuO8lw==
X-Google-Smtp-Source: ABdhPJy+ntryNxMMtGRFyrUJDMqeG9+2Ot6eBUuFU5NupzS9Wf3MsgmDYwTqxrb/v49wE7tT9TvY80DByIJbOyxfcNo=
X-Received: by 2002:a5d:6648:: with SMTP id f8mr3755242wrw.396.1619471243847;
 Mon, 26 Apr 2021 14:07:23 -0700 (PDT)
MIME-Version: 1.0
References: <167925D13277D687.1887@lists.yoctoproject.org> <CAJiuCccapfx2x4XSqnT4eUBw7B74u3e_O96-BE=NX1vcUuO=HA@mail.gmail.com>
In-Reply-To: <CAJiuCccapfx2x4XSqnT4eUBw7B74u3e_O96-BE=NX1vcUuO=HA@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 26 Apr 2021 22:07:12 +0100
Message-ID: <CAAnfSTtCcn6nDQKvJp4yhdxoiH=CenpfKu-0i55A8t-Aqaq-QA@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] [RFC] gator: Add new package
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 25 Apr 2021 at 17:16, Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com=
> wrote:
> The gator github specifies that:
>
> - libsensors source code in daemon/libsensors licensed under LGPL-2.1-or-=
later
> - mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
> Mini-XML-exception
> - perf_event.h from Linux userspace kernel headers in daemon/k
> licensed under GPL-2.0-only WITH Linux-syscall-note
>
> I'm not sure how to properly describe that in the recipe.

Two parts:

1) Set LIC_FILES_CHKSUM to the list of files that define those
licenses, eg the libsensors license file, and the mxml license file,
and the top-level license file.
2) Set LICENSE to the union of all of the licenses: LGPLv2.1+ & APACHE-2 & =
...

Ross
