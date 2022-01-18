Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86421C433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 19:39:31 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.1944.1642534770113107434
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 11:39:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=SSS4J7EZ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id q14so23265063qtx.10
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jan 2022 11:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qtLDUe+WWCMAtbbqkHnYm6cH36nsm7qxlOsMmFemIpE=;
        b=SSS4J7EZleVF+9nCqMNNhhlqh7dOEtJ0ceIhgnMOcJLO+ZWze/eAS1VIiem5HyV/kI
         aXbg+2gWnLyZYzT2V/ofOHmeyWxb68Pr6dxXjPpzQIZueRqRCJ8hJ1/p3U1y4o3QJzya
         FehiKiWo2+qFN3GFM3659tVLF4/GZlr1xmm4ox075UUoCub98T84zJYPQrnlqwsK+sXD
         R6Szwwrt2VSRoyh3Oh0FZrmq7da7l6VuWx76JI2CS+3a27keniyaU2ihK8qLBWhlUat8
         XOTWRReUrIVybrBzDUTiSWv0asjcRRk13xYHtfooKxrLZ+PPRoVu2Y/Le2wh+VWPfr2E
         6pig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qtLDUe+WWCMAtbbqkHnYm6cH36nsm7qxlOsMmFemIpE=;
        b=gOq/+OfUPp7Jp0qWXMMZ3FuIvoQS3Ol89qa5YP3Ms1Uc1tut4ev0Nj+XHEjmwljWIJ
         yVm5iZAWyMiwNg5jx6e9StHMmtv22gwqL3OFQiGqA0ddc+IQv7W7oYFoffzfTV+38649
         YylkfJMQnFPY1oqgBbru0Zo18ymq8VvSacFEfAqZgg1NwDpDBVQpCnCYZPeHIya/n4QA
         uIh6XWXbvOkSZRu8wVTqBUi3UYm0UkGR8FxdOErDanVgqzfDEXyHHvR/2qyZSdaFXmgc
         3n4JfRYnHPtuF1v2GIAUfmJFQIw7zr2YeKIIfCv4VPiAl21ccD5axqSZlswGdv82popk
         Yqow==
X-Gm-Message-State: AOAM533H9iJhAT1EyJcG1cDZ7prkCymDBNYL2qphUa5LswOxV8/P0jmF
	vSqmXFphThooTbzrxe1pR1SJ2y+jjcvK5g==
X-Google-Smtp-Source: 
 ABdhPJyoYSxuaGDM9VViXZFKrzMny6t9IRvuGiXLnNq/Hifytz/K2cogqccisqa5kwqp/MeZu/ZT0w==
X-Received: by 2002:aed:30a3:: with SMTP id 32mr22450799qtf.660.1642534769170;
        Tue, 18 Jan 2022 11:39:29 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:ff9b:992d:3671:5cb2])
        by smtp.gmail.com with ESMTPSA id
 m12sm9877121qkk.70.2022.01.18.11.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 11:39:28 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/psa-arch-tests: change master to main for
 psa-arch-tests repo
Date: Tue, 18 Jan 2022 14:39:25 -0500
Message-Id: <164253476553.1176362.1606063627083722048.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220118133619.4101-1-vishnu.banavath@arm.com>
References: <20220118133619.4101-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 19:39:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2862

On Tue, 18 Jan 2022 13:36:18 +0000, vishnu.banavath@arm.com wrote:
> master branch is renamed to main on psa-arch-tests github
> 
> Vishnu Banavath (1):
>   arm-bsp/psa-arch-tests: change master to main for psa-arch-tests repo
> 
>  .../recipes-security/trusted-services/psa-arch-tests_git.bb     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

[1/1] arm-bsp/psa-arch-tests: change master to main for psa-arch-tests repo
      commit: ccf342afe1de9592e93113742044be968fc21787

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

