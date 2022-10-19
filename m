Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E5BBC43217
	for <webhook@archiver.kernel.org>; Wed, 19 Oct 2022 18:34:40 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web12.363.1666204471282642951
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Oct 2022 11:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=nqUQS4c/;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id i9so12003842qvu.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 11:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NM0G4K9ew7+77+En/n0J/QbRsQYnaYK3V+pkJaBxTs=;
        b=nqUQS4c/JXhOEpIa5jZC80zEU5LHMtHaDClhwHTJwlcdURgau9yNDIsuePkcADb6Qd
         f6gpV/EAKkeV+W0XcL4+IJ9QIUuj+E8ip8NBZ8OpvOBHk6tE/fC2MHYr/mWa1jBfslma
         qbc6zQlJUyP5GQ8x8AwBQFwVD2wP9TWaVmekAr3jQXl43yAhXEoJmYR0mNW3kDGni32P
         /jpe3TNVkj+UlU+fSkklIsUY8wzC3oDbRmkT8ahFFqGOfwFmLYwvFr3pgy2kcF1DMy20
         pyq17AwN5aWTqrLVHGoz/Sl9RnWp6iHIWdjUlbSgv24hcFxMROHlYUSdsNkOXXxJyCqf
         kevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NM0G4K9ew7+77+En/n0J/QbRsQYnaYK3V+pkJaBxTs=;
        b=Bm0i5GswnQXIXIEBDIzH2G9pm9uil/fNfdnAYX1YBnCuL65ka9/gzNiTOj0Gk8Sg5d
         fi0V0nQ3wsDkPFS4/F3U6fdZ0p8MQEU8GJMBZ98kn9GQYZHn+RxtIS+hLBeA4jJglTzs
         FUl5IEBWDGXixRf4RGXItTGL2TQqjv8RubB6h8XuKD84s/wcaZRfZ5KSvR41fnhbl4UR
         1SVGd2R98LW1yOmmTYvU7a6ILhCELRa3DV6yKKD93en4Q1tPwuUW1Lwh/xGFNWJN/zkJ
         ZAEVGL/DDwRWwy6jptudWw4xH7lPYVhECLm10zn80sRemYSrIxL+w3Y0mZLJXfBUVayd
         zj4Q==
X-Gm-Message-State: ACrzQf3QG/eLims9hdrsCu5jufv165kTgUb3vHVwcFNsnHWLLIgPy00i
	AxFra338/+5nKUgutl6e+3oPOfV0qvmtbg==
X-Google-Smtp-Source: AMsMyM6PPQ5mfKaVeBl0P1M1g3oH87A78B00C/ZxXTJrA79Kwy7z6Pkq/P+PNfop0fChbfhWl7JOoA==
X-Received: by 2002:a0c:8b0a:0:b0:4b1:9500:4703 with SMTP id q10-20020a0c8b0a000000b004b195004703mr8059739qva.124.1666204464155;
        Wed, 19 Oct 2022 11:34:24 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id d3-20020a05620a240300b006cfc01b4461sm5363343qkn.118.2022.10.19.11.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 11:34:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Devaraj.Ranganna@arm.com,
	Vishnu.Banavath@arm.com,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH kirkstone 0/2] corstone1000: kirkstone: backport kernel compression
Date: Wed, 19 Oct 2022 14:33:31 -0400
Message-Id: <166620441106.1443084.4106886279249855316.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221019091557.3949-1-abdellatif.elkhlifi@arm.com>
References: <20221019091557.3949-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Oct 2022 18:34:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3986

On Wed, 19 Oct 2022 10:15:55 +0100, abdellatif.elkhlifi@arm.com wrote:
> backport from master the commits allowing to reduce the initramfs bundle size.
> 
> Cheers,
> Abdellatif
> 
> Abdellatif El Khlifi (2):
>   arm-bsp/corstone1000: use compressed kernel image
>   arm-bsp/machine: corstone1000: disable pulling the kernel into the
>     initramfs
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/corstone1000: use compressed kernel image
      commit: d54e50daa6973aee9ba2df7886dfd296b6c154e2
[2/2] arm-bsp/machine: corstone1000: disable pulling the kernel into the initramfs
      commit: bafd1d013c2470bcec123ba4eb8232ab879b2660

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

