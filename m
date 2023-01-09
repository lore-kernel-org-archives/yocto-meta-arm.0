Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B91DC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 16:22:59 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.76517.1673281369725135421
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 08:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=sosdaBO6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id v14so8235160qtq.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 08:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U52jSEfhhduz/ykno2M46vqWkOUP1LYkkL5lWR5Sx94=;
        b=sosdaBO63t4NdEkoXNhGkOWVdtopHDBSc3A0vLEbfs8oSWeNq+2BbAB6qQ8yHkaPFo
         NSQW87yT1Jx6QcmbV18o3PwhCZ40uMfHS0SE3sTxr+g1fyYA152X4dGZJrkV1Aq+r/Uh
         ZTPoRLyf/4M6BV65OpFyRUvnFQHXVnJ7xQLO5o/z5fViU0LK3BgjzWZRdV+LVAdgoTlg
         dGTppGAzSGo31gMdEmp2FlDsLh5VOpqeEsEzMiUu0Yj5UG2s5uP90gqCvg7ErdUfsdc5
         EBMnNIt3uFTQCs7R9MfIePpT0zkFkSyFHWMcyhLsT5lzn+PL5fsFwSk3nZXu6d+obnUb
         SIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U52jSEfhhduz/ykno2M46vqWkOUP1LYkkL5lWR5Sx94=;
        b=R5rGWkrAGbF+Yej1aA9+j+xOhNrJqqNAeeOxTq//Im8y7+RX6wiVz9/dRBnKtOD/YY
         9mO9Qgg7jMG354fp14oy0rT1vgMhAI53d0vympzL0r3UaQckZF+iXTHdooj/0KB7GTyE
         TGdou91ZyJl+7dD80vdI7u4jb1YhkycXNEJYmgnSXNHWqku4/cA/u9KFDM2uX+i39W/e
         T9U5JyKhnOb8xETlMwbO5m7TB+YGHWeiXL+U5k/9ZGBrOmMK9Th2vLW6bMaLDhvMHaCI
         uY/EsUlUQu9mRhQ679j28cd86b168anVbXPnZW81a7pfuKrADUhCxIIZ6GE4KDp939Hk
         omsg==
X-Gm-Message-State: AFqh2koBKSH4Ip2+WYryBpj8d7hyaeVXhX2Y228pfNrkOhUljB8As6Xn
	fo50dE/CLyV0RAHXlHW3wOc8JIfAmS4vo+PT
X-Google-Smtp-Source: AMrXdXsaEnhnLLR7ydkHseesgb3hLmnZM8wDU/A3wTPbCuag1bhyazzopIyiM08EWM1Syf+ujoXK5Q==
X-Received: by 2002:ac8:6f05:0:b0:3ac:c2b8:19 with SMTP id bs5-20020ac86f05000000b003acc2b80019mr8394438qtb.19.1673281368220;
        Mon, 09 Jan 2023 08:22:48 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id h4-20020ac87764000000b003a7f4c69334sm4729620qtu.24.2023.01.09.08.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 08:22:47 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH][dunfell 1/2] arm/scp-firmware: rationalise SRCREV/bbappends
Date: Mon,  9 Jan 2023 11:22:24 -0500
Message-Id: <167328134390.3643702.8520949917472302137.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230109144130.1399220-1-ross.burton@arm.com>
References: <20230109144130.1399220-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 16:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4240

On Mon, 9 Jan 2023 14:41:29 +0000, Ross Burton wrote:
> In "scp-firmware: allow setting log level to INFO or WARN"[1] the base
> SRCREV was bumped from db1991 (the 2.6 tag) to fd7c8356. This means a
> fair amount of cleanup can be made:
> 
> The base recipe should set PV=2.6+git, both of the existing bbappends
> already did this so those can be removed.
> 
> [...]

Applied, thanks!

[1/2] arm/scp-firmware: rationalise SRCREV/bbappends
      commit: a07dec8ad8a260f293a55e8300f514dee134b2d6
[2/2] arm/scp-firmware: backport a build race fix
      commit: d13be36099aff7ea2975a1a197564e2e801707a3

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

