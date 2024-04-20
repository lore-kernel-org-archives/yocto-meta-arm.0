Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ECAC07C79
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 22:45:00 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.22307.1713653081403921631
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 15:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=XKbwT1jq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-78ebc7e1586so422647785a.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 15:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713653080; x=1714257880; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5OMZpUdQxatafOBEZfAEZJ+Et5DEJdcxa/sSFBXqyw=;
        b=XKbwT1jqU5/56OA+ZbtoBS62GhqfYfQsEkpNqS+QI/QVtKWR75nbIN9D+PpAwJuc7a
         Uh3vocKwBOW3aB4GxYondAbIzJQNh+hh2lHrZhFguEIrKH17J3SyJtZ0HsiWlKe1FKNz
         DzKOh0/ufgPOwTeK1sxuch7UPzFlqTxkcJd9Rjv3IbCqNgT/RjYwWOx4t15h+NYZFMbV
         7832M7iNX5hATGGX0vqJ9+TtCmcm7iNgbgty6tTgn/2gV4w+80y0fVB2SoK8EqT4qxpX
         lYwWlCfEhEhT/5To9gF5/MnCjPq1dHeoG/DwaTXy07Nam0IgJ6CWitCrnXUYRDSIQ/zn
         6lBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653080; x=1714257880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5OMZpUdQxatafOBEZfAEZJ+Et5DEJdcxa/sSFBXqyw=;
        b=J1dhmQsvip/O7C2mVapO+rZY/XFYAyGxe1I+s8O0zdFzHrNsBtgcP1KiAwNZtjAtHf
         8O0q+ZXIYle3Cf852osZxzaVpBnc/h6TAcBzRLdb+vwFcUI8vPBde3ZMMex0ylJ/3Ni5
         mT986R9Jq4QVF6tqAO9eRjKMHqSeGp1CcBCB3w8FEb4J8k4+LbYykzIC/Lpljp3TiylC
         SXE//OGD/RwHiYH3yoEeAOtFotHDwE5hnIHhYbiWu3edSQgau0P3R/wsT9l+b9VDCIZz
         xAM7y/dfsRBMbsGJhRNz6qKaQtVRtJ0qnZsTO/WEJV6xNue6HeaACqT/dnTEm5EyT3xC
         aM/Q==
X-Gm-Message-State: AOJu0YzB3vToAC79gKFQz9NQqvjFdQyWbbncMdxMB1E6alYO/iNV27In
	P9uL5nD8g2Oi2aZd97TNsQ7LsK4CB8A5oCeqX7crV8OmgZ7mq+tTHxJCflRgPazpZEhZ4xkNYLY
	=
X-Google-Smtp-Source: AGHT+IGIWF93FldIdkOIlTNZqQ6TJhjAp8AIQsT4L+rQ9go0gqbxXALw4r5CkdYaoR9A/485PZQyJg==
X-Received: by 2002:a05:620a:44c3:b0:78e:e679:23cf with SMTP id y3-20020a05620a44c300b0078ee67923cfmr15313005qkp.1.1713653080308;
        Sat, 20 Apr 2024 15:44:40 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id xb17-20020a05620a5ad100b0078edc0a447dsm2846536qkn.68.2024.04.20.15.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 15:44:39 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	adam.johnston@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/corstone1000: Fix RSA key generation issue
Date: Sat, 20 Apr 2024 18:43:16 -0400
Message-Id: <171365299871.816258.2134350796125994089.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240419131130.1988653-1-adam.johnston@arm.com>
References: <20240419131130.1988653-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 22:45:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5570


On Fri, 19 Apr 2024 14:11:29 +0100, adam.johnston@arm.com wrote:
> From: Adam Johnston <adam.johnston@arm.com>
> 
> A patch was dropped when trusted-firmware-m was updated to 2.0 but it
> had not yet been merged upstream (2.0 or master).
> 
> Adam Johnston (1):
>   arm-bsp/corstone1000: Fix RSA key generation issue
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: Fix RSA key generation issue
      commit: 115196939f3c127e90e69efe2149c269eeb3f022

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

