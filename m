Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B24EC25B6B
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 22:51:12 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.57816.1698274265722436744
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 15:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Y+Ho0SsC;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-778a108ae49so114524585a.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 15:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1698274264; x=1698879064; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bpgr/54GNiuXyU1Q/Zu96I4TdQqMZ07Ba6yxZriVIZQ=;
        b=Y+Ho0SsC4GaIIfp6dWgqgD1W2LTQSgaYjsA08fMGn8FruqjqgVJzMkaxfHm65Chk/p
         xcCbmxULOBI9exo2iDeGVt2rS1A9FoVbUe87g19e7q6F5zgSbPnx+NIrfCTJ98XlV3Kv
         YiSz3UgMNFcDbp+2RCcSPVL/B4MrwvESNsXueNGmwfWxfGuYeRzN1Ni/RWPXkAMOr7wh
         FKZ9k3Xf0vNT0fc9nrGaBJSdP1AiP34e6juUr61/NQ3zngyTUnlTpaQXmTCv/GFIvgVE
         qZ+9m9HbhSUu8sOnfz+xfu8fwTJwTLkIHatTixS7TwO5MnmWaOz+ZeWTHN4awuRwpdoi
         udUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698274264; x=1698879064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bpgr/54GNiuXyU1Q/Zu96I4TdQqMZ07Ba6yxZriVIZQ=;
        b=or5Fj8+6/aYWi3Snl/gtovdkMoucZXidSlVAV91y9ywZ6kg/hf29t57xZ4pSLPSFpd
         NcgQx9sQxf52+yb7jzkfSVesMfdrVWhY/3ev3V7yhCGwpntNVYV+MgR5Z3dFRoJ2iBZ7
         IcTwlal+ULOsoGNNg0S7Fk9mh3wYJcGZjdXK69r8I54enjRoyWRKFo7walfjULNUmJ8x
         xGTKXdC7ZyagiPp9dc5G1ed/RWCJ2JR1OnEWY+ZaUVkaF/nZWZ89fTIphk87P94HxIsv
         IQNbTfkXDtOOpWMe2CNPca1Y2Gc+zEJUFtbTkyAmyRRSTyT+7T6xNOme9RgmuXq3XQQx
         CXJA==
X-Gm-Message-State: AOJu0Yx6JWUSDmOk/XUnwaHiWF1yav1sNM31ICLc9InicwHTSjokn6Uj
	oPhj4X2uhxa3RXi5i8sW4PEAIRJHfGudUfqdARI=
X-Google-Smtp-Source: AGHT+IEC9WGAQsdMMI7sEWmnayvBeBSuSyk8FenjIq1ut7ypXig/4+T/PdvXuuvAKW1OQEfOqJ6C6g==
X-Received: by 2002:a0c:f505:0:b0:66d:995e:24f6 with SMTP id j5-20020a0cf505000000b0066d995e24f6mr1146531qvm.10.1698274263960;
        Wed, 25 Oct 2023 15:51:03 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id x11-20020a0cfe0b000000b0065af657ddf7sm4671507qvr.144.2023.10.25.15.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 15:51:03 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	xueliang.zhong@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: update to linux yocto kernel 6.5
Date: Wed, 25 Oct 2023 18:50:36 -0400
Message-Id: <169827423607.1366514.8639373672873542586.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231025181011.2345557-1-xueliang.zhong@arm.com>
References: <20231025181011.2345557-1-xueliang.zhong@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Oct 2023 22:51:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5175


On Wed, 25 Oct 2023 19:10:10 +0100, xueliang.zhong@arm.com wrote:
> From: Xueliang Zhong <xueliang.zhong@arm.com>
> 
> Bump kernel version to v6.5 and rebased N1SDP kernel PCIe quirk patches top of this new version.
> 
> Xueliang Zhong (1):
>   arm-bsp/n1sdp: update to linux yocto kernel 6.5
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: update to linux yocto kernel 6.5
      commit: 21df60b921e0ec95df6723c8ee6cce617c96e2f0

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

