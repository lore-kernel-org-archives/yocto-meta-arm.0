Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C893C47079
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 00:46:40 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.39962.1704501999133595059
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 16:46:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ZO8g2omr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4297bd091faso5996431cf.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Jan 2024 16:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1704501997; x=1705106797; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wRlezl7UY5SFdw5ZIATCDNCsknP+KZsfvOtCbzscdg4=;
        b=ZO8g2omr6wwIiBc5jMvcpuRcUXUCIJ6qRKgaeMvu02YN8LmZmqtZVFo6u8owZMFMxI
         tGSZqiz4ndjP8/Ke2h6QeoFClDJSt2VC14Ph4iuCzrkgVcKPMb+tO6TJ4JHnWpBM6qLX
         OdU9+qHjASw3GqGnzUeK6H9hRJxq/XOCBmSKK6jQFd+LtXko4thTFAp657YAYpf2ASE1
         SErkhS+i+MWBUgkkr/MCrpQV6Z4gjm6vgNDq5YZL4LARhailx978bpGLRZRU7uzmaI0w
         hx7guiA1noenAaBWWXbNt3yx6emM2Kzt2JiYy3U01osx+AiDqSgBUJ/zFWQDmJmD2g4i
         vVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704501997; x=1705106797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRlezl7UY5SFdw5ZIATCDNCsknP+KZsfvOtCbzscdg4=;
        b=DkBMrmrTZ0zI+SIt40wSQ0S7nd8UvnJ1C+DwB2dC8Fi6ynTE/lUOc0Ec0Ftl9iuWKX
         FPOE3RDe3LSRJ6pweN//KIcvJETN0RcjwC6vtyn41YtVaGg/EROQJl1XZG4RFooWZ3GS
         CAw4rPkg7qGRYIf0SVZM1ftbHl/sG3MzgOv/xBJy5bZFt4N6gu6oxdVf10Msxmd6hCTP
         DlggqHoj0M739w4iJCelKTXdBWv6gxUcEQm5QWgLNhadcE4aLblt6QceH00ofMcLNNK4
         m/tEs2Fhnj4/6tkylxXT83qWPwBcezay5PVaLOaKvvEqFfENJ07BF24UtspswwPYNu4K
         29WQ==
X-Gm-Message-State: AOJu0Yx1qqpsAAvf611KBECG/UVtn6Hkdtdaf3kgEz+hX7UVZ+se2HLz
	2bZ7ugeRtdPVX1mjkUIF8yKHJdfHqZ06/8avfmfBhmIMaw==
X-Google-Smtp-Source: AGHT+IHKKvyjUk79GpLDWeorXCj9vdqcqGZjWqSnlEPHyGPqAGW+OB+eub6ZndgSsULtTT8REvGTLQ==
X-Received: by 2002:a05:622a:1985:b0:429:7eaf:aa71 with SMTP id u5-20020a05622a198500b004297eafaa71mr1123757qtc.24.1704501997288;
        Fri, 05 Jan 2024 16:46:37 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y9-20020ac87c89000000b00427b3271ab4sm1204197qtv.41.2024.01.05.16.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 16:46:36 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Subject: Re: [PATCH] arm-bsp/linux-yocto: add linux-yocto 6.5 temporarily
Date: Fri,  5 Jan 2024 19:46:00 -0500
Message-Id: <170450196046.2446090.17594215792913814616.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240105140357.2504123-1-ross.burton@arm.com>
References: <20240105140357.2504123-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 06 Jan 2024 00:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5317


On Fri, 05 Jan 2024 14:03:57 +0000, ross.burton@arm.com wrote:
> oe-core master has upgraded from 6.5 to 6.6, but as we have BSPs that
> still use 6.5 (corstone1000, n1sdp) we need to carry the recipe. This
> should be a short-term measure as 6.5 was EOL in December 2023.
> 
> Also, drop the unused 6.4 linux-yocto which was no longer needed since
> N1SDP moved to 6.5 with 21df60b.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/linux-yocto: add linux-yocto 6.5 temporarily
      commit: ad9eadb70e7e118f3539a11c4ef966b6a2c1af8f

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

