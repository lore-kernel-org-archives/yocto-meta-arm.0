Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6B6C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:30:27 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.879.1664991018574136381
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=DG8zmm7A;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f172.google.com with SMTP id d15so3016801qtw.8
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Oct 2022 10:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cMAvFy0GgaSI51gbdZtsljvQZYe+pxHoreP2U6/D6Ac=;
        b=DG8zmm7AVX4a/2deAaneSCZUhmYIaEUlJc/guFhmgsEgbVW5Vd6o0widgSlS0qYYlM
         rg1pLOZwBtEWR7rGjjNRic1WXhmEtKtXY+ByPW7TQBPpPkJbA5YXmYgV19Z/FN0J1/Kc
         0/OlmGvmlrM858eKQT0hHqdIFEKIWagGCMr184EOD+OAELloc0Ns/mvwSfUFsiwIIidk
         esOQ1WHEY7ltkJZPeyYPBKfjQdbk4DBUTkAyQLaSAbyXGDbvYHnJR3ZB6DCe2iFhWuBP
         cVbHiJrEYYCARInry6xjSxnwi1HvZ3wofPoU7N97o/56UH1mqvO0pMYVxwcLSzzteFou
         1jyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cMAvFy0GgaSI51gbdZtsljvQZYe+pxHoreP2U6/D6Ac=;
        b=phM/ohs4ZE4BZEOl5cffwwnf4zZGwfHZJMb9pqJgwpSEjXqOBG57w2OIUw7hvjwNt0
         rOCL25gbju/v+NX1KWjntsEDmr46LNgeFpPZoK+URFWWtHjw2Gyny1AsdSce0oQ1X9Nr
         q1ld1JDe6QIVBy8K5ctMQv4KUxlUVG6StIDGS0QJfo9R+Ystq2UCFb1Q4LcO2vYxC7Hc
         DrIOOSNQytlZfA/njkk1TqdIG2MEJDzeuCrY1Bmw/9xVssHx632IdXgn4T0Ug1kXLEWp
         /ZkGhI9ymFRNsQ6Dy77eeKn2Fv+BHUzBjOsFf5XIqIN98bRazgfcqHc9UB4VHgYyHefP
         /hvg==
X-Gm-Message-State: ACrzQf3qfJPa/F+a9MEwl0pkesvPLB1ossIieOMJGFQwmUAC7RKNR0qH
	AGAvQBMX1HGnqxP9yTz/vND/Mb8qNWVpkg==
X-Google-Smtp-Source: 
 AMsMyM7pXLm1Mdt2iDLXljZbfNZmQDSkuPI5VDba9ZLcu7ZLI5Lvxv0sS+dMgtVRwE4OQ2PfreAe9A==
X-Received: by 2002:ac8:5f0b:0:b0:35c:e719:c507 with SMTP id
 x11-20020ac85f0b000000b0035ce719c507mr471982qta.611.1664991017222;
        Wed, 05 Oct 2022 10:30:17 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 o15-20020a05620a22cf00b006bb78d095c5sm15832478qki.79.2022.10.05.10.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 10:30:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/corstone500: upgrade kernel to v5.19
Date: Wed,  5 Oct 2022 13:29:38 -0400
Message-Id: <166499097864.3072074.923932970270795353.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221005100315.15427-1-vishnu.banavath@arm.com>
References: <20221005100315.15427-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 05 Oct 2022 17:30:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3939

On Wed, 5 Oct 2022 11:03:14 +0100, vishnu.banavath@arm.com wrote:
> This change is to upgrade kernel to 5.19 for corstone500 target
> 
> Vishnu Banavath (1):
>   arm-bsp/corstone500: upgrade kernel to v5.19
> 
>  meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
>  ...op-CONFIG_SND_SOC_AC97-from-multi_v7.patch | 30 +++++++++++++++++++
>  .../linux/linux-arm-platforms.inc             |  4 +++
>  3 files changed, 35 insertions(+), 1 deletion(-)
>  create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone500/0001-arm-defconfig-drop-CONFIG_SND_SOC_AC97-from-multi_v7.patch

Applied, thanks!

[1/1] arm-bsp/corstone500: upgrade kernel to v5.19
      commit: 797e43e09b63002429499820d6248c17b8483d05

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

