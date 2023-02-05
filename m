Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1765C636CD
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 10:00:36 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web11.26183.1675591229967261004
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 05 Feb 2023 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=uHbHP/HN;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id v17so10032364qto.3
        for <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 02:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8/cJK/e7Xmr4zHvqSseJB49NH0pLmThwT8GZ1mZ40s=;
        b=uHbHP/HN4q75xoZWlv3D/SlPLnmjencQRSThKEHNOmyM9yXrHjCosnwKssK+0pzHdw
         mys0xCzxglWXzVN3evEonyU8tL27pIlqEHVh0pPXlTawJfO4xfyLfreyldMxp5KRxA54
         7zB4IKPziCO/kAPPKjv1NG0/5kiWwQs5Vjx2qnhc2NeUAbAKn48LhDtTIkEKtTnPPpuO
         Tsjuke2Mkb9BEH7dh55YXyTBl05aK6m0QAWsu13sUpplf7jQPTzFLO9GtiaWf5CqFJxU
         rwgAqAS6R8oucmmsOkIPkNgIb+fWDC//XNjxK4jyBrBd1KyZnQTbcOLuHAhrRR2kenIT
         rvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8/cJK/e7Xmr4zHvqSseJB49NH0pLmThwT8GZ1mZ40s=;
        b=QD/6QFVrS1sGpy5LRrZacPm9CPAGneFTpwC71FhdgqWvH9G0EOEm7WZGntm83XsnqA
         vf7OnxfyjFL5gOXGFjrT+a+yQhH3Nw8JmF/vk8a/+peC2pQdCkqC3C/cA81Jrq+yOO0+
         3yXIbn77WyDAoA4tjo4/Rpppy7QwfuGz8XI5iXVtS+gaUHqp1IslFuetO8yamheoitHM
         Uy84slBo4HDJVpIEMTOBskmAXnEDL9X5BY1TL/DagLeR5zjcEPqEvUzmfKezA2vHaSjT
         wsV5GtHHwHEyNM2lbuSCr2huq9d/EmAW9FNYD9LCwQq0roCHTHFLOMpKgmHirsfDxjJT
         jwFA==
X-Gm-Message-State: AO0yUKUILLN+kw0NT/63atKeCNAA2noNIv2hZCBa6emTa4E+bj97Pf2k
	J1TwrVkHRSajw5sYeveViB0kIJDnwn3iUrbB3xo=
X-Google-Smtp-Source: AK7set/edyibUGSmBWtjScGxJajYRiTmuRQBYJXUuj8pntolToZ9yzWvTI04Ktdt17XLa9UN6C8GYw==
X-Received: by 2002:ac8:5c07:0:b0:3b9:bca3:d94d with SMTP id i7-20020ac85c07000000b003b9bca3d94dmr29691261qti.29.1675591228664;
        Sun, 05 Feb 2023 02:00:28 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id p13-20020a05620a056d00b007208dd55183sm5243918qkp.40.2023.02.05.02.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 02:00:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/6] meta-arm: add build to gitignore
Date: Sun,  5 Feb 2023 05:00:19 -0500
Message-Id: <167559121905.1756899.12615968081405280016.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230202095456.3113221-1-ross.burton@arm.com>
References: <20230202095456.3113221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 05 Feb 2023 10:00:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4365

On Thu, 2 Feb 2023 09:54:51 +0000, Ross Burton wrote:
> To avoid having always tools that depend on git ls or other
> git plumbing to include and spin around the enormous content of
> the build directory.
> 
> Just add it to the ignore file and make that build content,
> that will never get in the repo invisible to git and tools.

Applied, thanks!

[1/6] meta-arm: add build to gitignore
      commit: 4704bf12921dae5d2534caf830a37c0d5458e730
[2/6] kas/corstone1000: move from langdale to master
      commit: 47872289aecc03abe20f2ae7a1607017b6b3bd63
[3/6] arm-bsp/corstone500: bump u-boot version to 2023.01
      commit: 5577b381645c21577ee52cf0380cc755b897c67d
[4/6] arm-bsp/corstone1000: bump u-boot version to 2023.01
      commit: 30796fb798d4d474ae478e4d63a2487737cfad04
[5/6] arm-bsp: corstone500: bump kernel version to 6.1
      commit: 03574e91737c8374c9dcf3674c17636c9fb1fbb6
[6/6] arm-bsp/corstone1000: bump kernel version to v6.1
      commit: 894e309eaf6b8e88f6ea6e35b03cb7966f214a08

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

