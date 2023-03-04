Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699DDC64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 16:59:56 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web11.12813.1677949175794744296
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 04 Mar 2023 08:59:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=ZfrPtNq4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id z6so6361411qtv.0
        for <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 08:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112; t=1677949191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSa5xxbVDmFcz6ZnQT9HtH5Go7XLnCykdzNQ1yl8k0Q=;
        b=ZfrPtNq4ZAWvFx+K2wg3IYvLxfgaLSjcx5yd03cCKyoUttdbwFpbjSqM6O4P+Ag5LN
         H+GGOd7lmqqDF6F6ebvCJdpmjL5tIheWgBS8VPFrctzEZjkqoOrxv9eAvOmGw+KB+A44
         jOt3O/laXfcqQHOuG+DsCgXoEXpb/TFiPpVPujd7XJFph1NgtMZ4V3oaIS+HKgFFXlUc
         MXGK+lfDbrrONfMwh/pZwPVDjyw1kWoX9x1VUXZ1PEvhegeunmPGL9IciqwgLZLI1a5p
         7jzDP7v9EFiADr4I0sEOX2/HHIk1H/sXZb9Erp/K5O/6f8qMHMhN2njsfl0ljz2xws7Y
         D/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677949191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSa5xxbVDmFcz6ZnQT9HtH5Go7XLnCykdzNQ1yl8k0Q=;
        b=Uq71MFFS7rYsMGnVl+AdCc+89bsvExldd8fS9w61cPIVC9V2aqn5seRvWbAN8FfqEu
         BFe/cfITQC78pN9yzYpqwbnxyckDMjMvB2I9/7o7UTtacDSF7l48MJDDanE38eTbDt1b
         rjKIbWDVBR9YEprpasxAsabMUN6LCIraCXP11jaMuoEwexKVpJGaM1tdlyGcFp3UzM6c
         3PHE6qh9PmsUoLGZJF4wg2lFnsj94bg0o0SfNb6t8ty6Ox/L2WZ9Xkr3vZFLjX4sWhEk
         TMirzW9xVob11UnY80UxMUBcbdKRctS1/U3j4ncBGbAXAHchLG2+23vzwWY27F1jFfG/
         DjoQ==
X-Gm-Message-State: AO0yUKXQzTJa2k1gq806xTuPrazp1mcLGoSEIiLFpI2Z7EWupSs9ccyH
	4Cax0NsLtNDPFoA02cwvRcMg2DRlRiCbVU0UM6Q=
X-Google-Smtp-Source: AK7set+iPJUlwUfHgYZNpU5yeQAmcwyWmqM7dB+xcwGy8zrUXtvqMcgaCZxHqLZHrZeROAiOZ/nV+g==
X-Received: by 2002:a05:622a:242:b0:3bf:a9bf:9523 with SMTP id c2-20020a05622a024200b003bfa9bf9523mr16500841qtx.17.1677949190951;
        Sat, 04 Mar 2023 08:59:50 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id y6-20020a37e306000000b0074240840c25sm4006580qki.108.2023.03.04.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 08:59:50 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] CI: append classes to INHERIT in the common fvp.yml
Date: Sat,  4 Mar 2023 11:59:46 -0500
Message-Id: <167794918716.51677.6375512580016624764.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230303160948.782860-1-abdellatif.elkhlifi@arm.com>
References: <20230303160948.782860-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Mar 2023 16:59:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4473

On Fri, 3 Mar 2023 16:09:47 +0000, abdellatif.elkhlifi@arm.com wrote:
> Making sure INHERIT in fvp.yml uses a += rather than =
> 
> Abdellatif El Khlifi (1):
>   CI: append classes to INHERIT in the common fvp.yml
> 
>  ci/fvp.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

[1/1] CI: append classes to INHERIT in the common fvp.yml
      commit: 27125aff1ca33644ba61de186cc1991db10b4ece

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

