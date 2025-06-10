Return-Path: <marek.bykowski@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E4A1C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 10:42:46 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.83414.1749552159022997154
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 03:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nkI0E592;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: marek.bykowski@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7d0976776dcso495294685a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 03:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749552158; x=1750156958; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuAIpb1fO2w1vwPANeRaVCp4Y+W9VbuJV1c5uzPYnt0=;
        b=nkI0E592CwwphFVd9lbb6UfLmH25n9oprEGNFqLysZwaSLu3gvcDuAHoFNWbOl8gwl
         FHf1PlBgla8vk30upz/oAhRVRZbcNX2Nwu039FkYAHogfLWgxRYNO+QNxuo6A25B0aPU
         7XxY2Q2OgGIGE02ZePK7r0EZeacQhbiHVdGW27hITltDZ6X7fg5LR4t3gPgCESrFvLYM
         81ZeORNfzQ8n5AjTXB5cS0DvWvzumIhcr6o3NWQWBm9ypHEdSYwEooS+nOj+bgVmLMHa
         CR1WkN6T64lj3GARAIvEYAXD94EYsrSuLDEStAPDTLW6NJS194EpF7hhfd0xyUhWcV8s
         gbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749552158; x=1750156958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uuAIpb1fO2w1vwPANeRaVCp4Y+W9VbuJV1c5uzPYnt0=;
        b=X26/z9FhdKYSmbNuvTZkqNNCkNH+8F2OsKADoGytIrs93bgpoEb5jHdBfD5X+V3T4O
         xSim8Ahz4EYUuvXaAbvBCIE/xazFOukK2FrS9X+arAITKUpFl5p0mJHAYFjf46t3JUBn
         vUs1ayLjzY+PW0TatE3W8ER33eqI1WP5/X1tskrbqxbs/4J8LaUOTjSjb+iiraXaOiQM
         HkfzNcYVB8OrXCH14dDKFf0FtNa6POggVYB2YuaRERTKCxz4V//cJ7NXpo0V0SiMKeGy
         Uoo8HFgGw4Ra2c36kB+ATlAYfWt0Z4qelDKcgFy7c20HiKd5gurTiIYGzjfhQqVc52uy
         WfhA==
X-Gm-Message-State: AOJu0YyD7CVJ5G3t7IZNOHRMH6E9N94DQiSorTujNpRZ/HKBQjXTbuCA
	7SmAMDdqes+t4pqA99/Jck7aJRQg0cjXHcGxubLKbmXfecfZ4f+nmgOHa76M25/h7nzy9gWYGY4
	WY6M5cL7lo9e+5YCGqfAh3Hb/a8G3QGY=
X-Gm-Gg: ASbGnct9zjVDyvrM1ickmTLgRI+rlvvfyaPDuPR/t84xNw+WGW8c+8iSTh+Vt0Ur4Zx
	9EuO9NsfY588rnb11subCFuqLL3dWeNODQa5nFNNuRWZtwXYLTm0i/J4I6lx/+lL12n44oC8mSl
	Vz3UDjyC0SgK3Rd6l8bip5eCO/GKNym4ur7Iu6Av+kCkQ=
X-Google-Smtp-Source: AGHT+IETq5FC3znU9TXZrJaTaxkoYwSDVs/3YHdvabVVQ7EO0wT5q5/XHBJpmQV1IDXvCDqC2DZKGpQAdwVRAsU+Pyw=
X-Received: by 2002:a05:6214:400c:b0:6e8:f4d3:e8a5 with SMTP id
 6a1803df08f44-6fb08f54906mr253426606d6.15.1749552157947; Tue, 10 Jun 2025
 03:42:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAHw2UgDSp9jK_9Q0FsdfiGPdmWmGQRTfiTQoBg=ZrD16q0ucXA@mail.gmail.com>
 <09231705-62A7-4D39-B395-D670B097BBB0@arm.com>
In-Reply-To: <09231705-62A7-4D39-B395-D670B097BBB0@arm.com>
From: Marek <marek.bykowski@gmail.com>
Date: Tue, 10 Jun 2025 12:42:27 +0200
X-Gm-Features: AX0GCFvUEJQW9EUh3xRgzpheAdIF47hKnwBc36yjDCDZ93SWfhVG1ae4PPHDuH4
Message-ID: <CAHw2UgCz_nCWMLJkSRFu6mYza=_x2i8-a1bPfF+nCCAWxWoC-g@mail.gmail.com>
Subject: Re: [meta-arm] fvp-base doesn't support armv8.2
To: Ross Burton <Ross.Burton@arm.com>
Cc: "meta-arm@lists.yoctoproject.org" <meta-arm@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 10 Jun 2025 10:42:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6538

Thanks Jon and Ross!

On Mon, 9 Jun 2025 at 15:54, Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 8 Jun 2025, at 21:14, Marek Bykowski via lists.yoctoproject.org <marek=
.bykowski=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > When I simply change to "require conf/machine/include/arm/arch-armv8-2a=
.inc" and "FVP_CONFIG[cluster0.has_arm_v8-2] =3D "1"" and "FVP_CONFIG[clust=
er1.has_arm_v8-2] =3D "1" " the FVP_Base_RevC-2xAEMvA doesn't boot at all. =
I do not see even a single line of log even from bl1. Would that mean the S=
W stack/Yocto doesn't support armv8.2 for fvp-base model platform?
>
> If you=E2=80=99re using a recent meta-arm which sets the base-fvp to v8.4=
 cores, then you didn=E2=80=99t also tell TF-A to use 8.2 and it might have=
 been trying to use 8.4 instructions.  See this in the TF-A recipe:
>
> EXTRA_OEMAKE +=3D "ARM_ARCH_MAJOR=3D8 ARM_ARCH_MINOR=3D4=E2=80=9D
>
> Ross



--=20
Sl=C3=A1n,
Marek

