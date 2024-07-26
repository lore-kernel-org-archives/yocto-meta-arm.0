Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E40C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 17:26:27 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web11.446.1722014786271263238
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 10:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=ikc0Z+l+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.221.172, mailfrom: jdmason@kudzu.us)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-4f6d01961a7so322704e0c.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jul 2024 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1722014785; x=1722619585; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vUVUIulOQj7M4gRO2GLE9ZjY8VfSntNOcNdTM1wTFs=;
        b=ikc0Z+l+rarZxfx8u+wattKCbUvQacmOGgF3TqHBIktlC4rjfIY0Nz9k76DWoOygwb
         XJuUweZqtqjxr3SpbtbLu7QHNmoLSnQI/rTRjEKwCI53Vk7Cc//DiwYHzOOandrNIF2A
         PNBakkm0sd/PlPR22BTtEBJpsBhiqVN2tgGlJGB2fWgy7nXcB3oiIufmwdj/2yQRwp0G
         sMFxTHCX6u1SxX/UONqPkPW8eKgTaZqrjjLqg0+Yw2Oqag3uvFzjhSHZVxjA2rXccJt/
         fZgIHMEbhQ77k5nq2euVX5TN+O/9xf06FW37CtbigYaZ5xQYcKGncEm4zRAsvmVfrB1J
         mPvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722014785; x=1722619585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vUVUIulOQj7M4gRO2GLE9ZjY8VfSntNOcNdTM1wTFs=;
        b=B/i1SWD4SvCY03SbBSjKZGSQnswhjiaxU2IiEoLcCBpZeXdqnOmZmbJvmVgfiYm9zC
         cz3NIW+012HeCuLP8rRKIifcUBNfYZTtfhHV5gialWPpGrvHDZFBn5AbdyXFeahoQX6E
         XJUv9fG8ifxzBN3/ljkbeSrFD4jiJ1y0rizUL3M3YZdRVCg2vbMH6VAGOq6jEBVkcJiL
         DctADgNUHMK/B6GWqJ2L5afeu9HUbaaFr9sQtKWjJ5flpvwCGdagvox+mgxPqwwGq2dC
         sahwbrxkxnI6E0FRrjGTsbbGTeoUsAb6jAD8T8WRqtKNUJnoPV1quuHGYLYW4Qpff827
         pM8g==
X-Gm-Message-State: AOJu0YxeNFhv4qZIVGHxyaoqd4jWUIlDazMdmkWnatDLcrXg7qwOIcfI
	FJAqA14xuGjrGMOm1ooHc7d05+eXIu+AVgjpkt8MXhy4eTTcvwygBtSZxaiI+WuMBSxVv2CV1EU
	=
X-Google-Smtp-Source: AGHT+IGTjTS4mEhDgl9oUFdZEJmb2QaLKMQFlDDLUyY1AmRbbgtuRakq2fA/n8rA5wHrkWHKokRsoQ==
X-Received: by 2002:a05:6122:2513:b0:4ef:5744:46a with SMTP id 71dfb90a1353d-4f6e68b325dmr145336e0c.1.1722014784809;
        Fri, 26 Jul 2024 10:26:24 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44fe841159dsm15103611cf.89.2024.07.26.10.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 10:26:24 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ali.oezaslan@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-m: corstone1000: Increase PS size
Date: Fri, 26 Jul 2024 13:26:19 -0400
Message-Id: <172201478076.93900.9470019555403416095.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240718120643.1181-1-ali.oezaslan@arm.com>
References: <20240718120643.1181-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jul 2024 17:26:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5925


On Thu, 18 Jul 2024 13:06:42 +0100, ali.oezaslan@arm.com wrote:
> From: Ali Can Ozaslan <ali.oezaslan@arm.com>
> 
> The size of PS storage is increased in Secure Flash to minimize
> the possibilities of it to run out of memory.
> 
> During testing of SecureBoot and SIE tests on MPS3, it has been
> observed failures due to secure flash is running out of memory.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: corstone1000: Increase PS size
      commit: e8b60718a8a99feb83f3469f0a3fa3a61010b51e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

