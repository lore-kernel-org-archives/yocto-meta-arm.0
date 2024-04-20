Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6398DC07C79
	for <webhook@archiver.kernel.org>; Sat, 20 Apr 2024 22:45:10 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.22311.1713653100520089682
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Apr 2024 15:45:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=oVdaYtmE;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7906776e17aso39188885a.2
        for <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 15:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1713653099; x=1714257899; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8FGPfwQW/nuwlj519cG7jlEdUMmGwkipjE9avA5NgkI=;
        b=oVdaYtmEZ1MGjiQgOgBZfr0VhuGU4fMkJTUIJKhutssvKCyVHhgmGgx622ZeGW0c+U
         8qJxiTMvYqZ4LvMkBtQ1A5Q0aganT/teH5jN+FYlsOSg7hliNcowPQ1quWwKZlLdxwNu
         SEvExKGySwNgRWy9FkPamoqTJeNIcC36pQZsVFo49uuK9QTMJMOsW96HEcU0tZQsB4YF
         ROnKu2Qx8RbKitWlD87gXAPPV7PtWwansYvg0QEn7WmJ1y7iVVmHB3MO+0kdRn+jbtCW
         PmHesfLrk4Ccn2QK+Wz13RCDIdRrjYrF6pSHVVWK3yx4WAYs1W/zZJUu7ssF97DcY9f0
         G0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713653099; x=1714257899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FGPfwQW/nuwlj519cG7jlEdUMmGwkipjE9avA5NgkI=;
        b=pBX0G5+qPOjr+TVRNX6BC7+WhGKLxpjeINsAIzHWronIKqdz3lskTxXF0+GfY5LnD2
         XruPzj/FcnLZjGHYEFf5YjWutlCm2FY/FD5vuhbftgE0MCPdFhDohpMN2EKuHupSNR2J
         vJuWXICSfvGQzkht8mA/WYUDe/HgwAMATuH/sqqZWqlWnzYFnxNsx8Jy6VW6DcOFFk+o
         Duz3M1RVO4aD/4IndxRyfMwatB+IhnpCRnahzI4oyJWcdY28cZCkDCzI9Mm+hny2iHpC
         GVYWkIvH/kOa0oIIE25oHCjH8WAGwxrhZVFJBNuu2F5mvn4J+D1Syrn7Gjra/956FglH
         xXaA==
X-Gm-Message-State: AOJu0YxqJxq0L0ebNdQxWpA1IpmneE+F2J+yEhKrV8jUWAaaQ9H9zKbi
	FIK6xoDyDi4nZvILOcuAVKuRbodwturcE0y3vHOD8BJh0SudEAIKpalECQQVtkaQzvHuEUS9EDA
	=
X-Google-Smtp-Source: AGHT+IFckMj9/dVVNE4khPw53jhoxuacPmv8ssPmeT0F28FCEz8lHhvEWcG/K0fgtYylI7RHLrBaBw==
X-Received: by 2002:a05:620a:4609:b0:790:6bb4:2add with SMTP id br9-20020a05620a460900b007906bb42addmr969093qkb.3.1713653099517;
        Sat, 20 Apr 2024 15:44:59 -0700 (PDT)
Received: from localhost ([2605:a601:919e:c800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id dc29-20020a05620a521d00b0078f060405a3sm2858417qkb.80.2024.04.20.15.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 15:44:59 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	bence.balogh@arm.com
Subject: Re: [PATCH 0/3] Use U-Boot tools for capsule generation
Date: Sat, 20 Apr 2024 18:43:18 -0400
Message-Id: <171365299875.816258.18229094767079242253.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240416161446.217376-1-bence.balogh@arm.com>
References: <20240416161446.217376-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Apr 2024 22:45:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5572


On Tue, 16 Apr 2024 18:14:43 +0200, bence.balogh@arm.com wrote:
> From: Bence Balogh <bence.balogh@arm.com>
> 
> The existing capsule generation class was modified to use the
> tools provided by U-Boot.
> The intermediate nopt image generation was added to Corstone-1000.
> 
> Bence Balogh (3):
>   arm-bsp/corstone1000-flash-firmware-image: add nopt generation
>   arm/uefi_capsule: use U-Boot for capsule generation
>   arm-bsp/documentation: corstone1000: update capsule generation steps
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/corstone1000-flash-firmware-image: add nopt generation
      commit: e6ff022d6d3d6cbcbd9b30006a75be69f7d35c29
[2/3] arm/uefi_capsule: use U-Boot for capsule generation
      commit: d0d1b96b0a39b973b6b882e561752c1fd7065fc7
[3/3] arm-bsp/documentation: corstone1000: update capsule generation steps
      commit: 527475c354d8897d96eb7cb7248f4207cd8f44f8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

