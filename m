Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C49C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 16:22:35 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.9892.1641918154489466532
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 08:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=DhB4gsG2;
 spf=pass (domain: burtonini.com, ip: 209.85.221.48,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f48.google.com with SMTP id h10so23813562wrb.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IGS+Lgq5QeMib4V3cnN3k97Hz9StpBrkBcjhLPaE9C8=;
        b=DhB4gsG2cfOcZlt39rWqmqoux9iLvZrZCN6vg4etgBRRTA2ud3iVV7fa8Aqbr/jKw2
         u4b6RPBHopF2z6CeGYK6tQGOao2J/hZGlnICjm71tdEPRYjT7kpY25LROodB/1r++bSv
         joJNHW4TlzJvaE7mRa+8arRRBT05nd5KIe8mFpxC1ReslFt2ZGIHM3iDEjr8SKTk1lpW
         OFy2Tn56kzVQYzE+x8FzdkhVJ3q/hrDCgBINswyOr2JQJ96tFVQnufl8DyVEZyAzT7AW
         DEBHbMb93t5PO7ZcntXvBON2QxzZoQz6CXu0uaWeGkjuhafSTRKmVQGJAWwvxfRJ9o18
         frJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IGS+Lgq5QeMib4V3cnN3k97Hz9StpBrkBcjhLPaE9C8=;
        b=XgNaWDGjgOnc5YICWkru0vHyl7wY8qfCSowu+yVnentIIxhbN3dYu5GIhn9OC5+H0W
         EYwwgdGXcyw25rOZ3oUvxwplJ6meFrER4u7q8HqfVqBvg+YVedWAjfAyFiFrXbQo/8tx
         XqsmxXBYzyN4O3RxcNWvQ6v6KvaBE7hVSqIO4N1gCHVsA9ixhXad0UhXhqN8QY0o7A1i
         FwbfoUTACnBAVEZaenSWPg0ktWL7UdAvfcGWil267LjvtUHYHJrsPla+YxAxf2VNhJMG
         kT2bhEiStNlwG0UPgF5ajyxgahOpAjoCFrvFBmE9HmOXNlnyEgsroO65nRsMHNNc0CM/
         gaMw==
X-Gm-Message-State: AOAM5322fuq3EibqrtGQGMiqdNEcDwtQ+krV2At19dSPYe/x0DktLogv
	y/qzToJCZVxgtYnDeXNX6u/QkY/bP0E9QbeZDVb2KA==
X-Google-Smtp-Source: 
 ABdhPJxXxux3mRudVDxvRb1T7Az+7xmPXDl6wJuJA+q+e9dGPcKAcB1rxVIgqLvRcQf/CA/gJdTBf48DYebLggtzXLY=
X-Received: by 2002:adf:e186:: with SMTP id az6mr4389806wrb.405.1641918152763;
 Tue, 11 Jan 2022 08:22:32 -0800 (PST)
MIME-Version: 1.0
References: <rRI3.1641859639524975819.4njv@lists.yoctoproject.org>
In-Reply-To: <rRI3.1641859639524975819.4njv@lists.yoctoproject.org>
From: Ross Burton <ross@burtonini.com>
Date: Tue, 11 Jan 2022 16:22:21 +0000
Message-ID: 
 <CAAnfSTse5TfHC=dN8VAG9aqTbaGv8HPv+sySOQxU2DEBQNTGig@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm/optee-os: Fix build race condition when
 using fTPM
To: rfairfax@microsoft.com
Cc: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 16:22:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2812

On Tue, 11 Jan 2022 at 00:07, Ryan Fairfax via lists.yoctoproject.org
<rfairfax=microsoft.com@lists.yoctoproject.org> wrote:
> Update dependencies to depend on optee-ftpm:do_deploy instead of do_populate_sysroot since binaries are being referenced from DEPLOY_DIR_IMAGE.

The typical approach here is for packages to also write into staging,
so files can be pulled out of the sysroot instead of deploydir.

eg optee-os does SYSROOT_DIRS += "${nonarch_base_libdir}/firmware" so
that the files are in the sysroot to be shared.

The better question is why this doesn't fail in our CI.   Do you know
why this doesn't break our qemuarm64-secureboot build which does
enable optee-ftpm?

Ross

