Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121D2E7717B
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 15:44:22 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.40261.1733499858120509695
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Dec 2024 07:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=sxl7E6XY;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-46677ef6910so19236201cf.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 07:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1733499857; x=1734104657; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bh1V5bZL5u8ZPOQEkLPMM9CE31rXIbMtEYrbgXm1nXE=;
        b=sxl7E6XYVjG9ljcU10XNN10FX1ef0d5rYWXWXRK8LO1QUUSF+RJXYiPYOxQJ9nZ73j
         eUa+7dkK06aLEnhMXgdoFvo0VJxv1vgXhVMJwPeFCTZqiov5zkeU+HexTxMa/21VZJPI
         S2lRBi8pMR07oiQ3aiphSmOCYYpHg8B5aqAnzg+ABfBgiqNKX5nPU7MiVg/Wg25ztH5j
         gfIgchf5KIoZJhtBBb6r3tLbNJsuSmuWMVz5lXvkKglxXKLYKAsMsJ24Bvl9KQC4Qdrn
         M8cA1uYm3JFyXajs7YnjNAmsWnP/oNd7bdeBScQOXH3VHuyFLZE8DknM208Xh9bhnIL3
         xzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733499857; x=1734104657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bh1V5bZL5u8ZPOQEkLPMM9CE31rXIbMtEYrbgXm1nXE=;
        b=NIP5GxfevoXg/sJMd4GC4J6N2tHrjil8B8FGPnYeJlwUxPOIWjwH2rLcDWbEk6qPnw
         R9DHCCm2cYZ27JkO+6k6qsTDFmDYITOwMHdfD53fEkPke2l7tAssFojfF8cYt8CzeJOK
         ORWIFOPxhe4LBbgQ05evFq/hBD5nHnUGC7Ckjz0KILznbxDcN6Yc8AkepdLpMz+/SU/r
         n0XR4ISR/2M1H9TdhcSgtyd+1y9WFm5vYkkFfRZPBj/QrmVDqqaR0pwsu31ORCs4n28P
         jlKDO6HxukpD5nHU0YTOANKGyGPyyvFhzVmP+S//S8sDS/SdZpr4UdjV5aVkg2h6fcF7
         Rlaw==
X-Gm-Message-State: AOJu0Yz9D/rJMPce/9wvasQt0Et4/d/TKaQzrsjTQBUq1IIcVnw0DL/U
	cjGYW6N+Z/1GHWMkeWHZ3kQx5ZZGw8V3evg0RWLLfvc2woUFQdvSU1y4mAm7FLwrNs9Y78PIJlM
	=
X-Gm-Gg: ASbGncso1qjKLmni8To65/WI1NQy6FJ+Rt/OUN6O0OOOkMzi73dpZVBYnmzm30ZVwwl
	OIOAemnMXOGODMJyzu2IM5sysHfUnAGIiGuN4CYPuW0p2zF6UQkSIPRWSQBZpA2XvcqmDoFz4rf
	asTmuBDuePtvDdp9P3ErXcPjyf5QwuD7z4DdFEAaO+F58QP249O3/hCi9FBcfO6D1dQicsSgejz
	5yl4VGshDr42Yr+Rf8ABgOYJYT+ah4WNjiEHuG64Q==
X-Google-Smtp-Source: AGHT+IHOsLRugz2jRsXhyAK95rw+Z94lVod0Ufze70+o4OacZT0MaJBD/aNdqd3VUzP4CrxcLOxvCg==
X-Received: by 2002:ac8:5acc:0:b0:466:9824:16e8 with SMTP id d75a77b69052e-46734c93b0emr70730461cf.10.1733499856945;
        Fri, 06 Dec 2024 07:44:16 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467296ef764sm22073951cf.36.2024.12.06.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 07:44:16 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH] arm/fvp-base-a-aem: upgrade to 11.27.19
Date: Fri,  6 Dec 2024 10:35:43 -0500
Message-Id: <173349934368.2735333.5368470467875934787.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241203142904.2700807-1-ross.burton@arm.com>
References: <20241203142904.2700807-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Dec 2024 15:44:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6280


On Tue, 03 Dec 2024 14:29:04 +0000, Ross Burton wrote:
> 


Applied, thanks!

[1/1] arm/fvp-base-a-aem: upgrade to 11.27.19
      commit: 82bb1d2190e78fdb554bd7f0f4208cb22a399281

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

