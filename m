Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B14E9C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 17:51:05 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web11.10427.1641318664739071125
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 09:51:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DXFERGjh;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id p1so42506870uap.9
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 04 Jan 2022 09:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EbvTjjMXFOHNoYSTvybGXshCJZd9LHHMZvYPbf37/tU=;
        b=DXFERGjhblaZonYqCWBpklISrztu4dRFOau9k2zYgSMYmCM6vPThBRvtU8ZJ7AaWOU
         uwzqj8vgzZCoCHYqvHhmg05FAw/XFGrH2tz9DX6l0SedkpMRuvpqyxBakAC7q2/g6eqM
         a24Mfe1souQ5j+YFSL+gPZ+BS6ph3LOrYZYKuILE0aJKurB67rjbtfE2gHDKVAgVGG3Z
         chzwUFCftMloAW5nwqplcXLl47kcVjFIWtE/6PNulJNPelARvLcZqI75teI9oCbTi7Z1
         E1IFFpTVOcTYYlxz5H9J/nEvfyCwFNU1BLrHXUHtVoRv+gZWIfHZuHo+SYHwSSc+NRqL
         19Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbvTjjMXFOHNoYSTvybGXshCJZd9LHHMZvYPbf37/tU=;
        b=fUrCjCWNhpOi4PQIBEAbOB2Y9qkcL94/QPYGNqCeyhPynoepWN5y5q/LLP0ihuRCTS
         B1eNITPoZMfzsosdfwgf/AK8r++tkxuw2cL8PHithl9mFhGAgUn4IkcwX6PG3evgxEKJ
         wHWeIrw5O/CQaxu59/yPWXh2H6xUgjDVJ0O/CAHEmTCl9YrYMtfw9sj2jX8+wz0ePJ4w
         j8EViJPi0bHN6fR7fQZ7Y3CPD3uZKoavWVK9lbJRuFaRyrcE2b8aWZYLKpzzuygol1DX
         cDuTlMXX3ZauBDHrmxQ3EW4hwnlDmd7AvMlV0wh0IeOjBq/PFzzV02yzmgr7XYpwDI23
         UD8A==
X-Gm-Message-State: AOAM530QKe0EZABm6yVkZtomwCsGo5099/+rG8WLETgJgv5x4wt67mOK
	3QCpAqkD2ibVaNX83yewYEIwDKGYyXsJxYdEMX4=
X-Google-Smtp-Source: 
 ABdhPJxQnwYDYRVTJCj25EHK1x+vtW0tYr2/qYiSqTWqKv6Qfe51wBDNuXEU+1Mg6T17QERtywPm45G2vnG9kSZxg3o=
X-Received: by 2002:a67:f918:: with SMTP id t24mr16106491vsq.73.1641318663897;
 Tue, 04 Jan 2022 09:51:03 -0800 (PST)
MIME-Version: 1.0
References: 
 <CANNYZj-5B_GUxmYUagqeEtJjDM3iyn0p26Xb6djnEUd1rPAv4w@mail.gmail.com>
 <CAAnfSTvvyx+2ry+KQV_vx1+t7eqH7NDkhqkaUgDzv1eHUPDZbA@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTvvyx+2ry+KQV_vx1+t7eqH7NDkhqkaUgDzv1eHUPDZbA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 4 Jan 2022 18:50:52 +0100
Message-ID: 
 <CANNYZj-JOXzsgo7fJfoB45Ldtxknd4Bv6Ya3QVFYa-0V3x_cbA@mail.gmail.com>
Subject: Re: [meta-arm] building gcc-arm-none-eabi from source
To: Ross Burton <ross@burtonini.com>
Cc: meta-arm@lists.yoctoproject.org,
	Stefan Herbrechtsmeier <Stefan.Herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000ecc72905d4c5470c"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 04 Jan 2022 17:51:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2790

--000000000000ecc72905d4c5470c
Content-Type: text/plain; charset="UTF-8"

On Tue, 4 Jan 2022 at 16:39, Ross Burton <ross@burtonini.com> wrote:

>
> Considering that the Arm GCC is mostly standard GCC with some
> backports, and our GCC is often newer, simply using the standard GCC
> (if the baremetal is arm-a) with -nostdlib should be sufficient?
>

Stefan, can you clarify please? I think the baremetal side is not actually
arm-a?

Alex

--000000000000ecc72905d4c5470c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 4 Jan 2022 at 16:39, Ross Burton &lt;<a href=3D"mailto:ross@=
burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
Considering that the Arm GCC is mostly standard GCC with some<br>
backports, and our GCC is often newer, simply using the standard GCC<br>
(if the baremetal is arm-a) with -nostdlib should be sufficient?<br></block=
quote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"=
>Stefan, can you clarify please? I think the baremetal side is not actually=
 arm-a?</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote=
">Alex<br></div></div>

--000000000000ecc72905d4c5470c--

