Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38AB3ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 16:29:33 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web08.8454.1663777768572059394
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 09:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=8WiVyKr1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id q11so4330759qkc.12
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Sep 2022 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=Xdbh/QmV1PFXZlUzEVi9DdOoaFS+BT08knfjHul5ta8=;
        b=8WiVyKr1lQu21R5kpIYx4M107YM8htXuSsntRxeKkjfCK/V0sLkbJ8gE4RxBH6EM9Y
         IF3x6cj5XKoR/17Z69Rmpbf4/EOLHYlqiki/lB6009mdjJJC5Lq4jgf5RMO5kM6m/WEp
         VOYur85KMEV2AK/OBLpvM/jn5/LkAB0SyoJv9uY2bwUkVG88uolU+6vEAGA0+XUmQBBy
         LYJReZBiy5JvZuHmxry1EWyLuQGHhBZItP4G+9f7d5Sw4qPFHqojo1PBvWv2llmlj6aV
         8oUeuv1fMhFV9o6QeSQHF4dCPAiIY2CbxXV/R6r2ieWOWSzomR3aU+E0YZNArYx5vMnj
         2Ryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Xdbh/QmV1PFXZlUzEVi9DdOoaFS+BT08knfjHul5ta8=;
        b=mgTRWUrw9ApGdOSBY9+ETozaCs3QrmViWbsC/5WKsvlFACjVhlGC0Y0IhCrtAPbH5/
         eKHUYnKO4SdKl5+3P2pdTWPK2L5JC+BSw2owKhpxhcAR3lCt2v1z4JW8r7GU24Iu9eeK
         UtGNr+MP/0yR1FykTQKYy3qE8yA6P084h2aLxBuXC5xtsbpLjgr/qriGbIkYsmdkU0vI
         Fn0UqE/+VS3DqqaUnnIk+Si7U4DnLTmTpF+TAVfqCf8VyUW5zfE4Eg8W0MIQxsE7zTZN
         lORY/V+1s7bRHAhZUWecuhnAQqyuVB1uWiuHX1jB1Gaf6hEA4zo4WTF98IjNLPwqFUeH
         j1PQ==
X-Gm-Message-State: ACrzQf3FlD1t3Owjh+6slFP7WwygkcJ/RY+OM/u4mOsvvvHhZiqLIh2X
	8zKCxt3qnfbOfGrR2fZjOWxruh5ogMMSyA==
X-Google-Smtp-Source: 
 AMsMyM6NNkCgJoaESk3WPllPXmIsi/F+JwUI6xAfgU1NZBD/N/3kDeAOtdRKaRJj2NtisSMCffTGyQ==
X-Received: by 2002:a05:620a:40c4:b0:6ce:9653:c09a with SMTP id
 g4-20020a05620a40c400b006ce9653c09amr20199513qko.219.1663777767247;
        Wed, 21 Sep 2022 09:29:27 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bm22-20020a05620a199600b006bb9125363fsm2180972qkb.121.2022.09.21.09.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 09:29:26 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/4] arm/optee-os: add ARMv7 changes to clang patch and
 update patches
Date: Wed, 21 Sep 2022 12:29:04 -0400
Message-Id: <166377774524.1593175.18138140838946639890.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220920223846.8000-1-jon.mason@arm.com>
References: <20220920223846.8000-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Sep 2022 16:29:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3802

On Tue, 20 Sep 2022 18:38:43 -0400, Jon Mason wrote:
> ARMv7 does not have fixes for the clang issues already fixed for ARMv8.
> Make the necessary changes in that patch for it to work.  Also, update
> the patches (via devtool).

Applied, thanks!

[1/4] arm/optee-os: add ARMv7 changes to clang patch and update patches
      commit: a3f22f90bb72a49b0b0fabe756e01a80e175bc45
[2/4] arm/qemuarm-secureboot: remove optee-os version pin
      commit: dfd03ca1a3549ed460350839cb460c94df2dca40
[3/4] arm/optee: remove old versions
      commit: 606e7d4c4e2f618956a8f4b1d792f19a62e62a05
[4/4] arm/optee-client: move the 3.14 recipe to meta-arm-bsp
      commit: abc8b4fe162a7199698989e7c0af329c87676fba

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

