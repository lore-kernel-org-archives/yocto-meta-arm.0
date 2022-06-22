Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC43C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 16:09:53 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.9052.1655914187703038618
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 09:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=rpnM3MVe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id cu16so25203715qvb.7
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qYODjOlpPtKy1ZH1MT3vBLvcgYbQwxWQce4M3f4N9y8=;
        b=rpnM3MVeR2gCIlSW2kZW2N0RoDDJjHBKlGOb5DAEUFoyNHMzSszNip/pnKo5+rMdRM
         T1tirAkgXLwlAKfcaPTw1zayM1QqrI52ZmVJJ6ps4o3EIGvr2DuwIGunzXv9t2OxANND
         IIznqiE4EbAllM7hOBdWApl0eop+18yMJ5m3AoxzlST/UJX4DCjpwqoV6JPfIobvuNsf
         FCk6iPJFYFGwYY4cLYzs48J+tMxqNLPuwzpw0w5B+XeiCyn7SHCWQNRtbofeP0losdHu
         C0UuwHJgcklhsdyKq3ad8pq0eUZItjhMc0J6UOx7OPP/d/+ngmYS1guRVskksz9klG9l
         3+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qYODjOlpPtKy1ZH1MT3vBLvcgYbQwxWQce4M3f4N9y8=;
        b=NBwvWlBInp+vVRTCtsIyjTlbiSZGcPSwvkHrV8ZsuDSkHjGRsnNc7f+xW5zhwFrrAC
         CyaJTtk97Y3/nHqX1T31KT7jXFdFMl7vcs7mBgIg3CpvnRTg0CFzukTrj6om3DGxfasc
         EPmE5TYR0f+JN1wQltm6xgaMmGoFcB/6xHG5DVPMrXLhOY1YJrMw5h5LhN+QfaqD8f/k
         E8wIJBixr1tVVvEIMbAZKUkjV4Gm7cC2DwkeED5vR3nC9D/QbnG2CZaHvi4XFOyg8obG
         iw/H+ME9uHG7Mcd5cY+1bUOJDf+D+g0Dh8oA2c+6k3GRAFoy4aJS2pAfuvU2hV9a/AFS
         Xm4g==
X-Gm-Message-State: AJIora+Lxx2hDDSHA4lmFv5CPy6iYj9fpv+U+p5MZSHs6voToqjJI7gD
	IVTya32YSaNP6ofEnKY08kEtbJKU76bhxQ==
X-Google-Smtp-Source: 
 AGRyM1um3szPIbpw4pze1eG/pdu88FK1tPO7TnRXJA9WOch+c8hitNb2tgGwjciL3OXpeDTCBogOQA==
X-Received: by 2002:ac8:5fd3:0:b0:305:2d70:e0dc with SMTP id
 k19-20020ac85fd3000000b003052d70e0dcmr3696843qta.685.1655914186222;
        Wed, 22 Jun 2022 09:09:46 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 e12-20020ac84e4c000000b00307cebe3e07sm12739363qtw.79.2022.06.22.09.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 09:09:45 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: diego.sueiro@arm.com,
	jiamei.xie@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/2][kirkstone] arm/fvp-base-r-aem: Upgrade to version
 11.18.16
Date: Wed, 22 Jun 2022 12:09:35 -0400
Message-Id: <165591417489.3733221.3999771360879637083.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220622133909.1526025-1-peter.hoyes@arm.com>
References: <20220622133909.1526025-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 16:09:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3530

On Wed, 22 Jun 2022 14:39:08 +0100, Peter Hoyes wrote:
> The new FVP includes the arch in the download filename, so refactor
> FVP_ARCH in fvp-common.inc to make "Linux64" available in the recipe
> file.
> 
> Update version and EULA URL in documentation.

Applied, thanks!

[1/2] arm/fvp-base-r-aem: Upgrade to version 11.18.16
      commit: 741509023867aa629f35289bba12485d4b6e3dcf
[2/2] arm-bsp/fvp-baser-aemv8r64: Use secure hypervisor physical timer in EL2
      commit: 32ca791aaa6634e90a7c6ea3994189ef10a7ac90

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

