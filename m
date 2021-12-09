Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34ABCC433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:56:58 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.15102.1639072616888929166
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:56:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=8NjXkRPE;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id t18so11036987wrg.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G64Vb8+3LGD8tS/POCr5gEkkFpU+sBSpuNwRltowggY=;
        b=8NjXkRPEugzLs3yjZGp8TMGCyt2gGsRddwW/zXphwP1ADX/CFkPYp2g1FLbXs+/4h4
         oXI6c0K21Mg3K4k2tT3uFCBpCX+jZfWCP1j4BMvFwA30fr3r6zy72MCSgG0GU7TrHv1d
         fft8um4AQfYYc9mDtmNf2hhon5vcIo5NU62Ul9GdEq/y1O6ci1rPhLTdbBKLlzu00qGF
         IPh1uUvP8VlbExgU0oGFz6TAmBobpeBBRY8SxgPhN9fQxS6Qr0rKFBtylCn2DsBMPt3G
         3J+qm6nq0EtMMBsqE2Of5Mz8wB5EAVfvkG73yBc2+Hs8n+M9WnUEOHDhI77f8+ZMTKr+
         nNVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G64Vb8+3LGD8tS/POCr5gEkkFpU+sBSpuNwRltowggY=;
        b=SDk8MEpS/Xu3ir2bcAL/mEf68vi6G3YBDO6BBytDB0EHcnokaJaFdHp09y3syw4ijx
         XXJD7/2friTbhbVUiLC+FaRgMtWImBR1RbxngDfcpAMkRZmVr6SEdPG2KsfcLDwszQaI
         XqCV93b3/rtEWeVed1G+4QDeuiEaE6oqwYx4wAm+8KCO5V9jJymnoNcGzU78oY/QAiHO
         OhPYafrIgSO1hFxMRUtLF8bAlL4LYRA8eQuqKdrKD72ZEh/Sk+ui/9LaKEKBweuJ6Kcq
         rgosGU0hDUXJopmP+/veZjRjrGKEzBzJH9AzjMqlWxwdGI3Vg6xXCpsFiVH+9kPH6hRD
         sWsg==
X-Gm-Message-State: AOAM531epkKPG9L2m9xUs9tM8SgkwY+qHDzqO7JU9+4Nrin6Ye7ajNZF
	279j0tNeAIPU3XKkmkiaYtHcAwcGOVnJ6yz2nIfPyQ==
X-Google-Smtp-Source: 
 ABdhPJwc9OvpVMFFK3J+KOfzIdAgpdOhtyk3WcTIdBURjFs0uq5kG6hN8CvTxMHXfaDjvU7fddYRqYRls2r0EggPXr0=
X-Received: by 2002:adf:fe81:: with SMTP id l1mr8250389wrr.522.1639072615237;
 Thu, 09 Dec 2021 09:56:55 -0800 (PST)
MIME-Version: 1.0
References: <20211208205809.3079680-1-raj.khem@gmail.com>
 <20211209130803.GA30223@kudzu.us>
 <CAMKF1sp+0EYS=NL3fjmOT0vc6BMgYkGB7nrxcvwW0Ar=AhgptA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp+0EYS=NL3fjmOT0vc6BMgYkGB7nrxcvwW0Ar=AhgptA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 9 Dec 2021 17:56:44 +0000
Message-ID: 
 <CAAnfSTugjDnJ2spAepURqBJJ6UnRJ_ZydTwdODOaVRqqBqhebQ@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] trusted-firmware-a: Pin to use gcc for now
To: Khem Raj <raj.khem@gmail.com>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 17:56:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2587

On Thu, 9 Dec 2021 at 15:16, Khem Raj <raj.khem@gmail.com> wrote:

> Reproduction is simple add meta-clang to your belayers.conf and set TOOLC=
HAIN =3D =E2=80=9Cclang=E2=80=9D in local.conf and unbolt this workaround

We build TF-A with Clang for Juno, so this isn't a fundamental problem.

I'm tempted to say we should revert this and let meta-rockchip set
this with an override.

Ross

