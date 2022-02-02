Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 648E3C433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 10:02:18 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.62420.1643796136891528737
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 02:02:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=0BX+HBTc;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id s18so37228129wrv.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 02:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/9n3MS/nFSsWXHTzOH9v9MiCdPdfUvQA2QIwbbxA/38=;
        b=0BX+HBTcrEeMGF/aXn61HhaFx3aUW0pjOz9Yor5dajtujy8P3Pk9OB+5zGkfXor0VD
         DaFWcTXNmZOg8DxA72uFux6dhkI392VKQsw0+U1eYnNzc9n74S2VqotYSofHvuc/JIve
         Fg5jaRmG+RymT2Tm54uXk4fPeGkEF14Fk/3GZMSsFxl5njhe3F5+7NMtTfWHsvLpPtik
         Mz6HUw/jQrB+Fr1I5igcqvNvNL+oxRzb5QdM34SaxxkK8eOc3r6NRigEuEIn/J/BcNhR
         IEqAwwKkiZQiCV9iv6dw9ih65H9fZgQ0/HsKqT65wZEbd9khSMtng7xRO9+8HY30Lrt/
         GckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/9n3MS/nFSsWXHTzOH9v9MiCdPdfUvQA2QIwbbxA/38=;
        b=bMiz9JB9SCPzO4D06m3HdrZqMZMl5p5RUs7rjmE0yJdIVZ5XXVd+Budf9MofPJ2wux
         A0VEaEPXuDwIPZ5Nit8+Wku/UCOmG2QlAt/ZlhAHzPs1XBPpPIpqTQsa1RA8jv2K1IE9
         iURfRGpU6qqSbTjUOWogStmbO9W2l8nWcA60ZTcONlVC9Rqwkc5IfBa9Q/jrXbTgkxxa
         J8d1KUWlW1gaa8J3HKY2BckDJnvCzUpK2IFH9u4m96hmFfJfl6IA1jjurnN1HG34aJpE
         NKg0kWxj4TyXrUYtLj1QeJsVXAlnDAPrJPgnsCs9/wDFFbY0CusnKgZ3IfsF8u/UauOu
         pCXA==
X-Gm-Message-State: AOAM533YYEeXutJa5mCZ/UGs15NU3xfAqsAjxFYz1ArWWH90V9TzQCQQ
	pF/NVfQFTe0pHzNqDtfPq0mJSW54c/gncKfHUK9ehA==
X-Google-Smtp-Source: 
 ABdhPJwb8cL/TOgachrZe58dx57n3ZeHvQ+jDrekDexqkuRi4bpPEEhknWYU6N3eHsBfx17tH1HO8G5Ki/Nt/qkOcjs=
X-Received: by 2002:adf:d090:: with SMTP id
 y16mr24447568wrh.405.1643796135019;
 Wed, 02 Feb 2022 02:02:15 -0800 (PST)
MIME-Version: 1.0
References: <v9L8.1643787766540396929.pFFk@lists.yoctoproject.org>
In-Reply-To: <v9L8.1643787766540396929.pFFk@lists.yoctoproject.org>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 2 Feb 2022 10:02:04 +0000
Message-ID: 
 <CAAnfSTvx2A27=+usWmYo5SpJtWmR5Dis6z2Lr1PD7zSukku3-w@mail.gmail.com>
Subject: Re: [meta-arm] YOCTO build for A5
To: ankit.singh3@dell.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 02 Feb 2022 10:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2938

The Corstone500 is the reference platform for the A5, so that machine
might be a good starting point.

Ross

On Wed, 2 Feb 2022 at 07:42, <ankit.singh3@dell.com> wrote:
>
> Hi,
>
> Can anyone please give me on building A5 YOCTO.
>
> Regards,
> Ankit
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#2936): https://lists.yoctoproject.org/g/meta-arm/message/2936
> Mute This Topic: https://lists.yoctoproject.org/mt/88853861/1676615
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

