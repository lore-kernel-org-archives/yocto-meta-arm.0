Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3C7C25B7A
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 03:09:52 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.32092.1715915384618924261
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 May 2024 20:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=HtBUTyZp;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6a0ff97a9c7so1564156d6.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 May 2024 20:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1715915383; x=1716520183; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cnvg2pJmKLqmB9Rxtt4S3mvxvZ3pqk/ezDh0WkZUIik=;
        b=HtBUTyZp5C9jL59tER+MU/hTnviQ44xWcTmDd4muP8inkzVxHUG7gc+Ermcv7OCrEB
         QcXb2S9Ha/XctQymdDBHLat1m/NW8E63wtr1QQ6mLVgzq3weA2xdlJLqGlcSil7gzIHX
         +Q/9bT7k0tiQVUcrdLuPqE2Ffy4rLh0m4a0iVXHnpFasDnLzupCxx8lmHqztsQnrTFKt
         XS48sXl5OK7nMv7SNNpecgms5qCxWI3QYYhiNTxZbVxO1443W0wAPy03Yb+5MlP64G9W
         X0XZU9wzoTOZGQ3+LwinrXyhsxh4ZdFtT6+5qoS1Xb53GpvFoPdtdALmFlKCGwXu4T1E
         /TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715915383; x=1716520183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cnvg2pJmKLqmB9Rxtt4S3mvxvZ3pqk/ezDh0WkZUIik=;
        b=e4maMOPEUeCLasHycd2uSIPVOGp/xy5dOSOUhrsfEdLCF44Gn+lXirlD+Uyfk8YMj2
         aP46jcttTqck5WCrl0SzilwnJu2kLIYGVpgOS4im5K2llCt6AIcg4XIh9lGdzRpkfpCX
         PTV96KcuV49A/JOk6TE+FBDJCRcCS4Aa/DqzIHHrNWt1xHhVXm/U4ICzrC5CnZ2Cth3Y
         8xtJqeyTd9OxTiqzNhCkeQOz5ih0dxKntr7DwP1WRCpZb4ex+F3MfyEyWCok65NQYBML
         kWTqortL+TeWN82duY3jyuJ3a4//ES1qSpPUKY72yzDblFsuAuA0hFQ0yudJ9dU/dMie
         aL5Q==
X-Gm-Message-State: AOJu0YwIejPsEHWy1q0PAjExIMRexw8gnuY6lMZv/WQoau9D0sHsYrrM
	RdDWHZCJ/xBVSntfqMI4pWwsSOUklsMo2RdG9HVFpozpZN4JiA5E9n6Bfq7N6RzyJJoWXugMVE8
	=
X-Google-Smtp-Source: AGHT+IEppNJQ+AnTK//ysxzGHwgm3qj6NxcpDEaSwGCXKDV2b3+5CWXApK/WFy8rY/fPaWAI5cxN8Q==
X-Received: by 2002:a05:6214:2dc1:b0:6a0:a4db:b297 with SMTP id 6a1803df08f44-6a16798c9c4mr369795766d6.23.1715915383106;
        Thu, 16 May 2024 20:09:43 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a15f1cd25bsm81546526d6.85.2024.05.16.20.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 20:09:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm-bsp/ssh-pregen-hostkeys: enable on virtual machines
Date: Thu, 16 May 2024 23:09:27 -0400
Message-Id: <171591536812.1562024.14290351049103833059.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240514104951.2496686-1-ross.burton@arm.com>
References: <20240514104951.2496686-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 May 2024 03:09:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5728


On Tue, 14 May 2024 10:49:51 +0000, Ross Burton wrote:
> As of oe-core b040597, the ssh-pregen-hostkeys recipe is limited to the
> qemu* machines only, so that it can only be used in development or
> emulation and not in production.
> 
> We have some virtual machines in meta-arm-bsp which don't match the
> COMPATIBLE_MACHINE in the recipe but still benefit from this recipe, so
> add a bbappend to enable it.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/ssh-pregen-hostkeys: enable on virtual machines
      commit: f37a6b32ec1a1c61d1cd20d6ef48f426e371ea4e

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

