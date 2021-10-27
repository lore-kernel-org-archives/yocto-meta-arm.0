Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566AEC433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 17:04:03 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.97.1635354242420051474
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 10:04:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=wvdzj9Hg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f172.google.com with SMTP id i9so2590408qki.3
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 27 Oct 2021 10:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=pGYGYlTvmvzpMop75u+saMri5NaPpt9sUE4HNpC8MKg=;
        b=wvdzj9HgghKoSveFOPp5UMrMSC1wNbpkW+IZn8eNieSJSjK9kiNa9reW8aBsr8umlc
         yyWguCfEcWYncpoKcYjIIdMIG90NoO2Xjrun+0AIvKdQPmeBtOmLK7eGCu7EYSCt0TmP
         oGR+9BO+eTjGL8ZsBGFitM5WBaWbKz2ZQ8ImgK9SzeQFMAv4zofoK1n5Q6oBrqKAqKaD
         DrgPdKNksq6dDW2eLgzbRxdXuVpmgp4Cl2JWepSo4SQ6E1SynI4U8c515bTYiqZ6UVRp
         eCRScdJ3Vc+jpHaJKPyu4rVqZGS+8kujDCvihlQ25cXThPbw5PlzDRAU2CoIlngcphUG
         /qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pGYGYlTvmvzpMop75u+saMri5NaPpt9sUE4HNpC8MKg=;
        b=4jDUazIvu98vXgxBrvjuWSJHJb+34u+U0GlknUfwlV4OfZteKCnxTuyeTS7epaWdBj
         N+oMtYMg+sENtShDIfI7OG6Gc/ZBcI9aDTS/P0tKRtl+FOQEBXIw0zUeTck3a39SoXQ1
         KHMmL1DCQfOWjdLZD/t8mY32tPy6xQq1hlg1q0W+zeSRHiEnbyeNRCt2FFPdtkLeaZLG
         qmGPYJNDxCqpYMZ27yt6OeHpL4M2TUfXuSclCs9Xdv/GPwIQMx49Tj4TIxPFSWKxsgJ1
         vyOBPdmTBHpeax6Wj/bgyQBPV39xzl6KnZj94rw9CEqnpEoQIX0yd0sCHGg0XP/OS5JI
         OEiQ==
X-Gm-Message-State: AOAM531PeHTSW/ydQ+l1ZTRfWK2L+UwY62xI2nwBB9sKS34YLbEt3jvY
	7c7/js3K3fAs3U7S38NtItfeJ4qei3tKNkQSFc2qkKNrjes9OA==
X-Google-Smtp-Source: 
 ABdhPJz5kolL6moVcdII/Ljjcrt4fatWoSasm9NAV9ESDJ2NBy0Z00/mA5LQi0FyEQrvhSdRwcBa5bswYNQEhGR8yWQ=
X-Received: by 2002:a37:e01:: with SMTP id 1mr1523063qko.336.1635354241266;
 Wed, 27 Oct 2021 10:04:01 -0700 (PDT)
MIME-Version: 1.0
From: Jon Mason <jdmason@kudzu.us>
Date: Wed, 27 Oct 2021 13:03:50 -0400
Message-ID: 
 <CAPoiz9yTJ+J+_XM7JkxC0D=zte_x7ASO1C7jSJoBmuG4qN8LQw@mail.gmail.com>
Subject: meta-arm honister release
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 27 Oct 2021 17:04:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2311

meta-arm has released the honister support branch.  The branch was
forked on Wednesday, 20 October from the master branch and was tagged as
"3.4" today.  The tag is GPG signed and my public key can be
provided if someone wants to use it to verify.  Per the previous public
discussion on this list, honister will only be taking bug fixes and be
passively maintained (with dunfell being the actively supported LTS).

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.4) with a "yocto-x.y.z" tag (i.e., yocto-3.4).

Thanks,
Jon

