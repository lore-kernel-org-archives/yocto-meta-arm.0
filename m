Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8DEC4345F
	for <webhook@archiver.kernel.org>; Thu, 11 Apr 2024 18:45:58 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.26552.1712861151691523961
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Apr 2024 11:45:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=e+NvNb8r;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-78ebc7e1586so119978185a.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 11:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712861150; x=1713465950; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdmYfHsut+LFINB6IOyODLCsqv5xWBKfz8+TynSZlE8=;
        b=e+NvNb8rZmE0wWbjafZO8YdcbX1qDVxhEqggdUF9dvjKcFb8nF6ioZDciPqAWKy/Dp
         JPIdtcFbAfrAS/lWgOKcr2OHl9vlA2rsrE+VNdzR85uXvVSJ9FUis6NNXerPz+KkAc53
         sdjIGfANIXED3/E4FS7hih4HGnzZkp546wkeB06E1R2D4WFwkZpgborx5FSIV9u+BfQR
         lw5zK2BZ68FEcA4TSoReGf2AE2hnOPuMskvGhJveNf28vnq/M0tde24TVI1uT87TMqzJ
         cDBxFhMlmpjXF6t1wdZSjjcdDGM/3TfDy9UWbmebh9DoJrHlnZ69QJmkX7kVgP7PSapw
         GSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712861150; x=1713465950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdmYfHsut+LFINB6IOyODLCsqv5xWBKfz8+TynSZlE8=;
        b=qjPHIKpYfpGLTC27BlHYRIHztOCY+5li6LAl++jffY4DXcmE5n3X4V/TBHxw2vwvIw
         geKzgDdv9RGWLBkKZaeAISsL53SDzl6R44a9tT52zU9ZnaoJ/izo8z64UihCmjzFdTq6
         SqrrDWdpenHfWDx2BjhFGt8uomrBBjc5ucdIFwHLiWNqOh/Dc++6WJsqGwO3/M5g/IvN
         8q0DEZcroTjQ70k2ZtiYy5E/ianOYOvrYYiHJB3Ce0B/pmtqkskaqcH2abHEWdmwIHQ9
         TZLLZPX8e1CeBAvjgyO65uMkvEMwhAkro3ftK3MVdzm8JDQR17upBoLzOacEIZjb2F6T
         Tclw==
X-Gm-Message-State: AOJu0YyKzK6jSb5DfXfzragwEm0WD8KA0bNODq8nrielWkoVESZqO2bU
	nkZqKcrxTMHsJj8qMrnN4gdYsC+MEYTsb9VjaJMfd3SHtz4moPcsg7Cu0zr+/mLGqrLlMhZSEpY
	=
X-Google-Smtp-Source: AGHT+IGOWjJneIWWu6I2UCuAhXiHJGS6JSbKVZ46YCtavzDTMhqzrMJfswcBfXG64L12sEmHPE4uzQ==
X-Received: by 2002:a05:620a:178c:b0:78e:bbda:8672 with SMTP id ay12-20020a05620a178c00b0078ebbda8672mr1215383qkb.1.1712861150536;
        Thu, 11 Apr 2024 11:45:50 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a09cd00b0078d6574d609sm1341557qky.52.2024.04.11.11.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 11:45:50 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	harsimransingh.tungal@arm.com
Subject: Re: [PATCH 0/1] Corstone1000:arm-bsp/tftf: upgrade tftf version to v2.10
Date: Thu, 11 Apr 2024 14:39:07 -0400
Message-Id: <171286075121.2560674.13974268602082832386.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240410145321.143824-1-harsimransingh.tungal@arm.com>
References: <20240410145321.143824-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Apr 2024 18:45:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5528


On Wed, 10 Apr 2024 15:53:20 +0100, harsimransingh.tungal@arm.com wrote:
> From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
> 
> This change upgrades the tftf version to v2.10 for the Corstone-1000.
> 
> Harsimran Singh Tungal (1):
>   corstone1000:arm-bsp/tftf: upgrade tftf version to v2.10
> 
> [...]

Applied, thanks!

[1/1] corstone1000:arm-bsp/tftf: upgrade tftf version to v2.10
      commit: 2007767dd54f1e53e5139d875c6dc0707e082c21

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

