Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8526CC05027
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 02:10:36 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.5699.1674526232611724079
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 18:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=roCtDmBB;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id e19so7505245qvw.13
        for <meta-arm@lists.yoctoproject.org>; Mon, 23 Jan 2023 18:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QoEBG3IUvLPkgPYavCJP8mLgD6KQ/3QP6itA+SbBow=;
        b=roCtDmBBp7PwBsE/cmDatyhkwWccQaWGcZB7M8IUvmv5eHJAdurTShstfa0bIP5ysJ
         pBaSX+/NjJiq/d8UXhVKDfacir8cI35r2VXXWEtWKKR4Owl7BG1w46XD/zwt3V5Ku+gD
         Vry/VNla0lC8yzonwnu27Gn/e3MC4vTPNWMbTke6jcUML3+qe5OdP5BhnF2kxuucXcHg
         MkJZAm7fTDKF8MW+ZaeVkxZMkwZGiftlQVlsnlsuGvx0gd2uG20itoou8wWYTK6R5jk9
         p59wrdtYXDEZBJMRwZjBLqOVG7ZIjajHzOdrLGQa7P6+rXc2G26//8V2vQVaEC/cWWJq
         XQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QoEBG3IUvLPkgPYavCJP8mLgD6KQ/3QP6itA+SbBow=;
        b=zvUS2UcMBYQHha/CW8uWQSmLPuVrta5ULP+ocAzpY4R4m0VhAxwRS/OYR6C7n9kz73
         Y14YFTeXnaYVpf22KAKsNmQIaWaA3xTrWnCUIMyyOgVIK67qvPlikScSqhqowYEX5fLN
         aKhz+5dDpZZFMP9HB2wczeOOE2lp8cekSuPume+57A33rG0P+/edKTMsW4sAeR0gu5lc
         5lIsp6yippY5+LSb4eVFrpfFHH5q1H543rSqqvTrbF7ODxW1bhPFTC0mjxCAtbFXxdoV
         u6jVVDEMloRE3o4UqNaWB7zMF083itI9/yVJI7qDKnsqMO1RM/X/QLRx4Zn5h+Rk1Pct
         II6w==
X-Gm-Message-State: AFqh2kr/I92aGH1x5XWlEXj79Rf0ZzQN9VFWYXJfvPODmqthoqPVI7Tb
	XPJuBd6kLAbj4bIJCqBwjYRTTy/BA2s+64aU
X-Google-Smtp-Source: AMrXdXtBmFWU1OZb0dktgqt1lEIMgG5icNkDZRoxikK0NmQ/o7HADcB/M9SO3kt0UJ2oqJEt/vDJJg==
X-Received: by 2002:a0c:f84e:0:b0:535:64bb:fea0 with SMTP id g14-20020a0cf84e000000b0053564bbfea0mr19520664qvo.44.1674526231348;
        Mon, 23 Jan 2023 18:10:31 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id c10-20020a05620a11aa00b006fca1691425sm573595qkk.63.2023.01.23.18.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 18:10:30 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/3] CI: pass --update and --force-checkout to kas in pending-updates job
Date: Mon, 23 Jan 2023 21:10:28 -0500
Message-Id: <167452622808.173967.1307979553558814037.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230118154123.2936427-1-ross.burton@arm.com>
References: <20230118154123.2936427-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 24 Jan 2023 02:10:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4321

On Wed, 18 Jan 2023 15:41:21 +0000, Ross Burton wrote:
> This job doesn't use the standard helpers, so needs to pass these
> explicitly otherwise it can pick up an old SHA.

Applied, thanks!

[1/3] CI: pass --update and --force-checkout to kas in pending-updates job
      commit: 6b98584ae3cb91e1302aff7c705c5cd3f176e939
[2/3] CI: use 'kas dump' instead of manually catting files
      commit: 513d085a169d84d140220d7167f59ad8b6302662
[3/3] CI: remove obsolete install
      commit: dc36e1de6b3211095bd40db39084f9626aba4675

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

