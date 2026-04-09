Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED0DBF31E58
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:57:57 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.131800.1775740275079472993
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Apr 2026 06:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20251104.gappssmtp.com header.s=20251104 header.b=sQqFdAXU;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.182, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-45f053b7b90so458113b6e.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 09 Apr 2026 06:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775740274; cv=none;
        d=google.com; s=arc-20240605;
        b=U72sR5MB3dnDVu2O+frRxsZw/OeGcZZ/+DFDaDKqn3Nml7B08EQxsBluHojz4+EDav
         GjFt6ijT8vi6lRRSi8xz47MpBPlhryecC/GnlovBGl/MSlSmTyea7Jb7qj20wqjFp74O
         BcjXarHNcsqrb78IHb8ip+88e1XzzQo0J60d4+/xKcutruRvOTgDYLoxDqCa9GyoUYHX
         XWJ4kHrcOeNtsSev5MdOIHTjJe0KCz4G/mubRhF7iMbV3miAfCNTmqrGRkKmECA413aF
         T8ck2CuInL/o5Ecm7LV72cY6o72dYUVOwCMUZdE4ZfZf/cgwTXk05mDtIKt81VJOm5CQ
         tgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fvunAgbq+cLVa/0QQbxpb7SbV5MivfsmCMzUSC7WDa8=;
        fh=d0lP92eq70Ag2jXXhCjuBc4Xcs3YNv0mV05nWxAvBEY=;
        b=UErYmkZLGBbk4leVYJSye00R1u0lSmt++dalGihlz2E8SGeB10jvpglRCdTzsMbqI2
         ydhKkckuCKOxBzQedSMk7GjB3xcCp/bwD0UfBf35rPmAfC3I/Rw8GdwrO+m5e1NRK2Ns
         NDPVVI6qUsI7LfidOxiu9HdxI5ogZdCIy1OYRPKnyJ7mOGLrt/qxJp4m6jlHdO7HTFFH
         lbTDxAb3xy+4hn2kXXEKWdiU/rjXRflV7OaCj5WG2WY7xTHoKDyyiP9TJyrpJlnO+4CY
         gVY5dfWjx28LI/n/ibY3nxJSOD0LbQwXNbr/zjsKCPvVIodOhK8EW5BYv5h9OViVd6Dx
         m35w==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20251104.gappssmtp.com; s=20251104; t=1775740274; x=1776345074; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvunAgbq+cLVa/0QQbxpb7SbV5MivfsmCMzUSC7WDa8=;
        b=sQqFdAXUV7G6y8L9/51HEo94O2Sp/jJKaUv4y6TX3qnBO/FTbyn03M0/Vrkhtm4BZy
         PY2raktl7dK2G6GjcTHuY8tyuXU794fNsbqps2nHP9NjVQ57L1BqR0P3sc3cdePGcUS4
         UM3k4MpV3jWaKgXvLX3Zl/z8gkblVkQ46w/OOD13MC5nQUDTXC72onhBJPIIPIm8Nwb2
         Z93pQ2WRTCc1e2KC5sLL9aHmlM29y+9MbK+FGpbgqIVvdaV9ujcBSu9Ftt7nLxaNoxmF
         6knghqjeul+xcsds7YvwL8HtzNVzMRzXfHwZVXgDt7KgHq9Mnq18lTUkTl62K00x7bYN
         ylOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775740274; x=1776345074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvunAgbq+cLVa/0QQbxpb7SbV5MivfsmCMzUSC7WDa8=;
        b=ClJPgEA8NEnISgHUWewVg8wO2Uk2D8O4XTcb67wl91AE7IRTfkE2u28w+Yrt5txodP
         RsQ6IqiOEob3kdMP7TG4UfWFFJvbzv0sXXoQm467w9OIhFakHeF/YVEWfc7x9gwMCnmF
         m9MxaV4Chj3LjJgjZ1tGgQ5G0SvZSq85ahRPnbDPk6At8vUqZhQPSSs/E5/HmSq4kMPY
         SuxzboB5WZrOvAOLhQYjwWVRxj1xHZY6TG0OIkug0sGWwxNfayCJAdZBu+lsNnRzzP3o
         Huum/QGp2gEQyUdvIFMu1sTCs4KXnyyqYThrz/ie/zbfEH6J9hDAcGYJszwgYKIwRE0D
         vn2g==
X-Gm-Message-State: AOJu0Yz24hO83Zdh21wGtvNoQRmmmf9TV6dv++oBaoV0irDAdvAto9lB
	Qn9mnn+RhZy3koZKQ4jUQrUYu9hDUQ7K+amGZe/WRhPQxpsnoozEZKSRETwG+2l+ueqwSUma+xY
	vIzvld6uDTydRWCTeZnsKaW+KmKuLSaIyVBQ1lWic
X-Gm-Gg: AeBDiesGbCN1G6rl/7fJE/IMtkfvKcEGCl747HjGaxH+3nnUByKkexuK0DD3mf0EiBu
	4X23NLa1J2xxP7e7zHiaSqozg13bFbCwbC0lRla8C3ePqEpvu3kirQsK0QrKg21ivNcMN1ocbkq
	Up4y09ayqZic2b0fuYAEnly4IyooAuqXo0KkP0rQCtgjuFebSZphloU0XFw0rKcfjyymBcqqsu6
	h/U5Bi+4z1IGy9UctNJ6fuKQ2a9NyJhc6Zxa7oaGsxwsKNPXVueccYJ7ktDoA5qWRLwQJtOClNJ
	4lxi8hqVgrX/vPoAig==
X-Received: by 2002:a05:6808:c191:b0:467:ebc8:6b3b with SMTP id
 5614622812f47-46ef54f5dc6mr13471381b6e.4.1775740274084; Thu, 09 Apr 2026
 06:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <adegeIztCtiLd_CA@colin-ia-desktop>
In-Reply-To: <adegeIztCtiLd_CA@colin-ia-desktop>
From: Jon Mason <jdmason@kudzu.us>
Date: Thu, 9 Apr 2026 09:11:03 -0400
X-Gm-Features: AQROBzCOoxgP69oh5wFTK53eS5VvJ-ZC6pnjYqt12rQYgFIxDElcphu8X8m9Dr0
Message-ID: <CAPoiz9yfKj4QfkWjq7vrBOUsoUkEwx2RbpPBqLf8q8Nhpv6Trg@mail.gmail.com>
Subject: Re: [meta-arm] Git repo down?
To: colin.foster@in-advantage.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Apr 2026 15:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7011

On Thu, Apr 9, 2026 at 8:50=E2=80=AFAM Colin Foster via lists.yoctoproject.=
org
<colin.foster=3Din-advantage.com@lists.yoctoproject.org> wrote:
>
> Hello,
>
> I'm curious if it is known that the git repos seem to be down. Both of
> the following links seem to fail.
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/tree/meta-arm?h=3Dmast=
er

Try https://git.yoctoproject.org/meta-arm/

> They were linked here:
>
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-arm/

The URLs on the git server changed, and I don't think the layer index
has been corrected.  I see meta-qcom is broken on the layer index too.

> Is there a public mirror available?

My personal gitlab is available, if the YP git server goes down for some re=
ason.
https://gitlab.com/jonmason00/meta-arm

Thanks,
Jon

> Thanks for any info!
>
> Colin Foster
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7009): https://lists.yoctoproject.org/g/meta-arm/mess=
age/7009
> Mute This Topic: https://lists.yoctoproject.org/mt/118741455/3616920
> Group Owner: meta-arm+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arm/unsub [jdmason@kud=
zu.us]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

