Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC35C64EC4
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 16:39:48 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.14008.1677083987408608102
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 08:39:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=FkPc3Bbb;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id x1so8817501qtw.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 08:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6V7SPcC1v4ux+uijVvN1eg7PzqPS0ZI7JQUM4fjHyk=;
        b=FkPc3BbbWN+NcEay3NZVBffq4uPEG0sGW4PRe3S9uXFkpPcn6sdSqu2KlAzYxcvQlW
         I6j8r1UG4yzFj396kf/hlID9MyobpO+1d7wuFEQEk6jlybTqMrV0DQFiuAyHyUvPkx21
         E7EqUmUjVlxrsmB2kdRiWsnC1wgf08eCKQMZsTAoQ+faGgrA8gWH7a67XRIiE1ikxCVb
         ojAx5FIePuM2RK3F8LNB6s39BTbKtPLlZePcTveE9E36Gt1KxRnTbHwpV6OGUqPtrjtB
         ZvRhv20z4ErbnhHNKeFy8pOoe9uduSbHlXvjU2pFIJ0n8uibcmyIMQpe8mFiFGNEMm+R
         556Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6V7SPcC1v4ux+uijVvN1eg7PzqPS0ZI7JQUM4fjHyk=;
        b=E+JMGrSf9liGzkHVXKpW51DyfXk5hNzkA0n2Z3yhkt22vDMMduXV44WUgxj+624MVy
         83G7Z9Zy2PSkOKcjgOulJprb9L4Bwm67xkegvETjew2q3g8PjpSJ+kokH0kAzG7idm+p
         emC8NxrvlBljVmnpEKgn8GzqjkEbQoQRUvOL9kRnuoA/UQehsfLDr3dPo4KDo9HzAFo7
         2T+UoBGuk6Oc7Ys3iWhCvDzi+B0GPd+PSg/kd+yviNEiKK7D+S93mPzX8H8E8ut6f8jo
         iRVMBkCzKh/uoMc77dUUztbeUxEGADzfZ9X/GDDW/qIZYsAJJ+o5zkRnl7rlzzUGvZ9a
         OvYA==
X-Gm-Message-State: AO0yUKU+Nam3dSQJ/M42mgpdMqfFoGszIde5mPxeDHwmYFCN5GVNukIq
	LSAetOqOW1QypdyYJLw1Wwvmh+/DpMqo1787
X-Google-Smtp-Source: AK7set/tuegNc95Wp2r4aPwdK29ODSr/xRhle5BIUbWbgB50UC/awyruPmxfFPuEiBFAmdKAD42Yqg==
X-Received: by 2002:a05:622a:130b:b0:3b6:980e:87e7 with SMTP id v11-20020a05622a130b00b003b6980e87e7mr13376184qtk.24.1677083986098;
        Wed, 22 Feb 2023 08:39:46 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id x6-20020ac85f06000000b003b6325dfc4esm3985839qta.67.2023.02.22.08.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 08:39:45 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"mohamed.omarasaker@arm.com" <mohamed.omarasaker@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] Align TS psa client and psa-arch tests with TF-Mv1.7
Date: Wed, 22 Feb 2023 11:37:31 -0500
Message-Id: <167708385325.3620198.13381593936852606254.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230221145056.278981-1-mohamed.omarasaker@arm.com>
References: <20230221145056.278981-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 16:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4444

On Tue, 21 Feb 2023 14:50:53 +0000, mohamed.omarasaker@arm.com wrote:
> 
> Align the trusted services psa crypto client with TF-Mv1.7
> - Update PSA Crypto SID defines value
> - Update psa_ipc_crypto_pack_iovec structure
> - Fix inputs and outputs passed to in/out_vec to match crypto service
>   expectations
> Disable the obsolete and the not supported crypto algorithms from psa-arch
> test suite.
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/trusted-services: corstone1000:Align psa crypto client with TF-Mv1.7
      commit: fd3b56802e74e968edd798d0db2cded7d872abcb
[2/3] arm-bsp/trusted-services:corstone1000: disable obsolete algorithms for crypto
      commit: 1fdb75d465c0b202da8530184d90b72bf07d672e
[3/3] arm-bsp/trusted-services: corstone1000: Disable SHA512/384
      commit: cbe0ce7992208a3f46d8b7bc7bccdb7e5e4cab37

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

