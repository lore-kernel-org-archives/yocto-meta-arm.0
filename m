Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC4FC433F5
	for <webhook@archiver.kernel.org>; Tue,  3 May 2022 19:20:10 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web12.1391.1651605608115433918
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 12:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=baKXsN1a;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id x22so9195786qto.2
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 03 May 2022 12:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sjdBWHuQhBORhU9B39HnA6vTmMb94OPAXtgAFCqd5NU=;
        b=baKXsN1alhOHgUF9UjDqW3ueL2OhOLoeO2WcXixKxlG4msbsxta2mli4lDaff/lAyq
         nlmh0bllwPB5fxWiGD8gOT5s/3UcOQqeTBW0awS01cQl87Jnb7uurntstoj83BOUxy+u
         M1jxiYNsMN1xoJAaK5eCZzpIG3OWCQ119sESoIVvxZ87PzJ3JfGt1u2jzptkIGbmytQo
         o3BMKALGZKtE/ubG2oNe6qaWp6Qb6Q11Y32uVsDKrfHnVqq2fOxembROBDlkPlf/rfcK
         e682yW21TA3lX1K9SFI/S4xm450C1QmyPBicjOMvGQnB5bLVHdrkJlMu9fFUbaVDngs3
         bc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sjdBWHuQhBORhU9B39HnA6vTmMb94OPAXtgAFCqd5NU=;
        b=g68k9SN5dBfrPj/6uryp/hEpofds2YAfjtp7HdU4qKwV2vGBEKbfI1eIk4ZvrMKKtV
         7UJZ6XKpt3UPTjp2W16hnTXmW/0k5Bq7Wd15gsZpQl7NwHlWwXZiwi6n18Z2rT0YdbQB
         5o0ghtd72E179+cIw057SydIEDfEhcGkgIFE1Nlg9aTzSwgJScl9omm+ZRRFny68q4FR
         QmHzkNw5/pxWjgllo4N2/9gJRmlbtUJxZso6u674VAAhqucEsHMMmNFWH+wDoD6XSMxX
         Ps5f2yD3yVL920QCwSdUR0eUIyvPY24u3t2I3gs6b7Uwsvn/ibJTB5iXIKSgipxdHKJ8
         r5ag==
X-Gm-Message-State: AOAM531Vq0KXCoM/OoyVb999rp6CtGpVh8irBBcFGWPfGw5hP2g2Lmda
	oJCIK+Jdio9Eszf/5x/VxTmz9j/A26NVNho+
X-Google-Smtp-Source: 
 ABdhPJxdoI5tTYm0kHClMB34fMWkRh8xmmA879RQOayKHd3jQc/dA4DkijEqFnDXgMQV08bfK35sVw==
X-Received: by 2002:ac8:7c50:0:b0:2f3:8593:26a1 with SMTP id
 o16-20020ac87c50000000b002f3859326a1mr15759839qtv.316.1651605607103;
        Tue, 03 May 2022 12:20:07 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 139-20020a370891000000b0069fcdbabdb4sm5272600qki.69.2022.05.03.12.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 12:20:06 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/trusted-firmware-a: corstone1000: remove
 unused patch files
Date: Tue,  3 May 2022 15:19:54 -0400
Message-Id: <165160559473.216975.2672203675314564235.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220503151636.8979-1-jon.mason@arm.com>
References: <20220503151636.8979-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 03 May 2022 19:20:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3349

On Tue, 3 May 2022 11:16:35 -0400, Jon Mason wrote:
> commit 24db3b56ba1285e4196da9416a8914c5bcaf8fd4 removed references to
> the patches, but did not remove the patches.

Applied, thanks!

[1/2] arm-bsp/trusted-firmware-a: corstone1000: remove unused patch files
      commit: 25e08f2671642c08ce1f7ca731c4f5b85d95429a
[2/2] arm-bsp/trusted-firmware-m: corstone1000: remove unused patches
      commit: 2627002c85dee658ebb6a293496a72a927ad1f77

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

