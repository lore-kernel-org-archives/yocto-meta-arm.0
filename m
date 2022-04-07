Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02666C43219
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 15:41:14 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web08.7934.1649344594687427930
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 08:16:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=ufFR/QM6;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id b18so8218077qtk.13
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2FfQpXf1HZ89mFWTMk37fAJhTzx+bOFKn74h+23KEqU=;
        b=ufFR/QM6pXhPSaukx/mS/PZ8RP/WKUKbzU1G7RdhitXsyaYEGCMDhjKEhP/cNt+uKf
         yVNwqm8yzh11N8jC343Sy1QaX1ZpCXNDjm/b9lUE/qIRYu2Qeuv0DV96fOAo3ofroe1k
         kCcKIgJpm46gtvSVz2UXecsTLhHHf4+5ClJ4g7fk7yGjBME27Yv5MfhDVAzdd/EzP9VP
         9KkWMJngzE22kiTqDLA0llacadpFXYJ3DWy5RzZcNG2xfuuLbqB1h2PTqBLcs0F6eMIP
         vq2abOIj3hCm3eNd4rIWaeoMqhEnqvJzVUlq+06/I9jAy08MqYhBqFqv+Bs1WcrvBO3x
         Y6Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2FfQpXf1HZ89mFWTMk37fAJhTzx+bOFKn74h+23KEqU=;
        b=mrVEsIcUCN+oMyak4fqLZ3NhbF6aW8xxfiBYjkaO1sIP0m+xLVHsNId5tb0VPFMXdZ
         3Eafz/0Jg95VixaZEGPntjKw+zKjPPZLL0tY0yQzlQUzheBrbhdrmcouLm/RKDh1jBvP
         THS9rP8embsKk1wtg3s5TK/OPTSMTrbNK6vjd66s1hFUsOmvk3H8FXg2K6I2DJs6KLfn
         fnFgj1QEZneGJsHmYGky2+eNnpzoSNeCf9/DoVJ51EOpbHWc0GfQ6+QcCxHB3a1THkm1
         NAQY1bEkY0WPXiROMGxjjwX2EPGa2PoUvzzbJVzBWpZ1GdGhmsL+VRgGZFE3gDxgAj1T
         4HAw==
X-Gm-Message-State: AOAM533ipSZqSr+HAercnLVv7yTF3CFzNMHGl6mjVjPGXbd59TwMitHv
	ZWA9dwzG8OFIbSOe0RbMaOQ0nLoitlBO3w==
X-Google-Smtp-Source: 
 ABdhPJygT/JKas0CR/JIfMhiQWCy0aX6v2uiXp8+KbtT/NszAG4SlL4tUz8BiU6qfIU3fQe5IjkPxg==
X-Received: by 2002:ac8:7f8d:0:b0:2e1:d52d:bf7d with SMTP id
 z13-20020ac87f8d000000b002e1d52dbf7dmr12096732qtj.501.1649344593412;
        Thu, 07 Apr 2022 08:16:33 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 d126-20020a37b484000000b0067e60283d08sm12111930qkf.40.2022.04.07.08.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 08:16:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"satish.kumar01@arm.com" <satish.kumar01@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] kas/corstone1000.yml: refspec update for run-scripts
Date: Thu,  7 Apr 2022 11:16:14 -0400
Message-Id: <164934457428.1830670.9678720098452015835.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406084834.16517-1-satish.kumar01@arm.com>
References: <20220406084834.16517-1-satish.kumar01@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 07 Apr 2022 15:41:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3250

On Wed, 6 Apr 2022 09:48:33 +0100, satish.kumar01@arm.com wrote:
> Patch updates refspec for run-scripts inside corstone1000 fvp yaml file.
> 
> Satish Kumar (1):
>   kas/corstone1000.yml: refspec update for run-scripts
> 
>  kas/corstone1000-fvp.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

[1/1] kas/corstone1000.yml: refspec update for run-scripts
      commit: 142ec9b8f99759a1caaa5380b3276e99e5e698cf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

