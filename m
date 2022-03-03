Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF76C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:16:42 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web10.13549.1646327802164582846
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=000UY9BD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f181.google.com with SMTP id n185so4408749qke.5
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Mar 2022 09:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=E0QM+stIkN6VVfN2hKYKFPtedENKQyyHsp8FqYr/lao=;
        b=000UY9BDvN2J280ufGxGKAtbpGyxFkTfSg/Xqg+/diOLzUoW6CuOEL8XKVl6S0HSRz
         qRW+vd3XoszWPx4rTucPe9zuIeK3XrzpSH4NnfBKpmAuLv5XgK3XB3rQ0jm46Tljg2SQ
         XJXL7MH22NXAMhAkm1m7AQ3DKwDkL55Hb1qXe+QJWiZG1Enx20pRtM32zlfLkk9a+AAH
         3TAMBdyklqkGxfsyLoEypgjf5gl+za+r/p40WPPLF/AdgmzryUX30pP49anc+1RFJp2u
         o8Cusc8wy7APv22Wr9A/nRoWGhiWzcDuEMp3mFcHMZ8Gr1m8+qrU2xESAj53n55gYGB3
         MpQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E0QM+stIkN6VVfN2hKYKFPtedENKQyyHsp8FqYr/lao=;
        b=21IdmY3rJHN9eM6mlnH9HTP1gyD9SSBXlVARm//vE9zkH90YlQuXHYBgmwQdjkhe6o
         84dz/16RH1gvrqCssRGY/Njd2EyW+TQMZahxlgB+V2xz1ZDWjSLZff7FY8wrHgIgNcs2
         cgYd+l8Zg/co3C7Z9meZgXioiHQ9ChxqFENEXJ/9u5Ipk2lGbUTr0uhUhmDXG1/bTnCO
         KRBrzpjzm4LwCvposmsmT8DMTHx9alC8A8yGYrLIza/gzqJRwOnzFPsZtCL52mMDnoWK
         O69Er4sChXhYsNZTxAl2fztrMVZYCDki4rr+HhmLBM7bGWcwLoBnZDiIEfSH5pmcuSgq
         HJ5g==
X-Gm-Message-State: AOAM531fiftix7h++YAiB5UxEgzbMlxhr+HN5afT2Uz6KwGVuF/8XPOb
	JotKbbGfIZBbQcuQnIQFmEqTWvZvY6slMg==
X-Google-Smtp-Source: 
 ABdhPJxZeJuDmXBPNW/ri0chD9Q4rZqHcUV+EVBrOudDpNPEnVXjUzBzceH/qkO5yZ5k2nIkj+Nzrw==
X-Received: by 2002:a37:9fce:0:b0:506:ec02:15a6 with SMTP id
 i197-20020a379fce000000b00506ec0215a6mr153106qke.406.1646327801126;
        Thu, 03 Mar 2022 09:16:41 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:cf54:5e99:f9d3:d9ad])
        by smtp.gmail.com with ESMTPSA id
 v129-20020a379387000000b0064936bab2fcsm1324647qkd.48.2022.03.03.09.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 09:16:40 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH v2] arm-bsp/linux-yocto: fix patch status for the CS1K
 patch
Date: Thu,  3 Mar 2022 12:16:24 -0500
Message-Id: <164632778401.2165565.6794997351367119542.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220303122224.912909-1-ross.burton@arm.com>
References: <20220303122224.912909-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Mar 2022 17:16:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3104

On Thu, 3 Mar 2022 12:22:24 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/1] arm-bsp/linux-yocto: fix patch status for the CS1K patch
      commit: 643cf58a6988505dbd9243142496a3bc649efb1c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

