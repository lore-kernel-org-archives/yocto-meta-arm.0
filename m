Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAABCC6379F
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:30 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.262.1676608287701078121
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ZwlUmWOO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id dk7so63136qvb.6
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VraIl7EoISQ0qWjRirqqyJlesIC71WUhkDp3f3OkMeM=;
        b=ZwlUmWOO5B0wYgDYmWg1dei5XQ22dv7npasIdPM0aVrFGZSgov0OrdP9aqTjeq1Ir7
         M75yXMHyPtgycOSGD/mSc/zOWXNGBU+2rLaaYUdCfnpKWbi/ar5hTXD++80LaC6jPiYh
         wUKPhahv2f9Ihd709W6cM08NsDrzw03PCu91eU5fqzdk+mC5dFHvRvHm1zbVT1bdtQDZ
         uENZEmln4GlmAyQN1rs8aZjxjmWx8sMlf0cFB8uXrnWaqpyUsfPa5TNNr1xSHrQRjf8+
         sPitGUfkB2+2iSrjmMe8rFL11rwFN/Xbitls6Hx7/J3RCLdFDMI2blAK/Dl+Y23TvF5X
         2PDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VraIl7EoISQ0qWjRirqqyJlesIC71WUhkDp3f3OkMeM=;
        b=yVGacv5cQWoUA1pl4XTK/XVDqNCdKrxHuHUO/bzXmPRBAp4IBf1kjhtqztkLEpkhR2
         acK/goXcZgXv5bsjqOjJm8r9C1IDEyLdcIzoCgMZUltxsJFxeB88/NE9K2GKRDL8ti+F
         ouyorMnokXPNtnsEtnUo02jN/k2fXzCRlYmO9XX05qaVR/vdRdodvAFvGtTXkwITWYer
         HhAzi673U7612nax08QyXZlfyquEOn+KDOAci+JFU0fGUjnGEO28CXWiZfkpAHGMUsoH
         x8ipETBGZXtiLtH/e+xRpz0RXPPGnNq770C/yIMYqVU8hY9sj8quG+ZBQfOdspntRaDC
         H/uA==
X-Gm-Message-State: AO0yUKW5EKMM2jhugxlak3GQ/nu1jJ3uQpnokDbCqZkVGWo4tBkpJaK3
	DzlwsEANllImHTDXTrHO1oExw4sezqbrjav+
X-Google-Smtp-Source: AK7set9+3RStZ9s6oXL4ERXYlIYwzw1mBYL62JxjRanDO+W4GrPurpYMDlpARdu49i6BUY8gx1WoRA==
X-Received: by 2002:a05:6214:2267:b0:56b:ee0d:e3b6 with SMTP id gs7-20020a056214226700b0056bee0de3b6mr8025675qvb.1.1676608286411;
        Thu, 16 Feb 2023 20:31:26 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id 27-20020a05620a041b00b0073b575f3603sm2543856qkp.101.2023.02.16.20.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:25 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 1/2] arm-bsp/linux-yocto: add 5.19 kernel recipe for N1SDP
Date: Thu, 16 Feb 2023 23:30:57 -0500
Message-Id: <167660825902.685488.11780819764591837093.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208133353.1969816-1-ross.burton@arm.com>
References: <20230208133353.1969816-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4420

On Wed, 8 Feb 2023 13:33:52 +0000, Ross Burton wrote:
> Currently the N1SDP patches haven't been ported to 6.1 and the
> port/testing isn't trivial. Until the relevant team has done the port to
> 6.1, carry a 5.19 kernel in meta-arm-bsp for N1SDP.

Applied, thanks!

[1/2] arm-bsp/linux-yocto: add 5.19 kernel recipe for N1SDP
      commit: 3d39ae853c91c8464815d3c34b339438ba735c95
[2/2] arm/linux-yocto: remove obsolete 5.19 bbappend
      commit: 0617555fa5ead9bc1ab07b5a4de17e6c3da16f95

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

