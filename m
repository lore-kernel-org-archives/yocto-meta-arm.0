Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21C7C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 13:55:22 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.45062.1710942916163872735
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 06:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=mmdTmShe;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-789e70d7c07so311823285a.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 06:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710942915; x=1711547715; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10M93xdL1rrzeRiBsAWqV+Xb6xkJ1YB8quWcBRDy0Sc=;
        b=mmdTmShek7pYm5KqrQOc0ndHER/l4Dj3K8zdobHynUE8rzNsE89A1mXEgt3xOhKs7H
         iZM3UyU9HawILwlCf5e9d9Wif/dk3R1a1YMzK/gAy8DkE5YKq8O4svQ/jkUuxWXsMbJV
         YCdKObTbmld+2ngT/8rOzoqI9K/ey3JDMnfoGncVIUtet5aIy0Vl3A9Jbh601PSUBFqh
         Rv0Dv6vXPtB9Jj8sGx5daSRgyPbGqIpRw7+1fm9p2v5VEu4rfyiZ5C1WBARDIeUGEafo
         N2oH8hMG55U/Bu+XKZxAkWaeWQNi2EQK1rPmLuGg9c6MT4yz2yPCcuI3jsPkPVlJL+mx
         0kqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710942915; x=1711547715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=10M93xdL1rrzeRiBsAWqV+Xb6xkJ1YB8quWcBRDy0Sc=;
        b=nUox8e7XyASr3OC6iJs2EAcmFOe0/LzznKL8Ry6R5mSaRZg4TR6RuV7VldGGjwmNJw
         19742jzbNUDJG/BGJWIp+oyOeoEll9E5VCju9CXgI8k1P+QtuWSFVmSf/jtwJZFr0oWg
         uRchJ+EOxqd6Hjwr85uBet/xBJfne04MD0UyJ6UJh3TQZmny7Wqw5t4VB+tzqw/dLhoZ
         hI4wndxFceVA2l2grXQFuwfuG37u8VMjiygrli2BRrZvx58C6DhEOpOGuOCu9kgaMxWU
         OdFZwfkBM4SRQLBT1skJ96cXxL42ILSU2efAnATz7kIQs2S1nds6ykGCOtRCXU1pjjYf
         iGiw==
X-Gm-Message-State: AOJu0Yzdg3FLUK77FLceChKH8P2p1P1xDRiwDVu/sVta//kdLoY6vprW
	NX+O/u4yJyNta4ajxNgmxU3aJQkQ+dHB819dAIKiYTRmZKub721kKksYszjxjMJAridymsBIeI8
	=
X-Google-Smtp-Source: AGHT+IFTdoT4Jvk/XwzvYtzMDb6lrxMb+bb8LrDyv3UuTjKB3ntgemXv+lqLqeV2gUdmRD5fa43Whg==
X-Received: by 2002:a0c:f2d0:0:b0:690:cff7:bdd2 with SMTP id c16-20020a0cf2d0000000b00690cff7bdd2mr1860825qvm.47.1710942915029;
        Wed, 20 Mar 2024 06:55:15 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id eq9-20020ad45969000000b0069155a36f67sm7845917qvb.9.2024.03.20.06.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 06:55:14 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	anusmita.duttamazumder@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/n1sdp: Update EDK2 version
Date: Wed, 20 Mar 2024 09:54:27 -0400
Message-Id: <171094287471.3509794.17073602353685714126.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240318113531.9598-1-anusmita.duttamazumder@arm.com>
References: <20240318113531.9598-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 13:55:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5460


On Mon, 18 Mar 2024 11:35:30 +0000, anusmita.duttamazumder@arm.com wrote:
> From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
> 
> Update N1SDP EDK2 version to 2023-11 and rebase
> existing out of tree patches.
> 
> Anusmita Dutta Mazumder (1):
>   arm-bsp/n1sdp: Update EDK2 version
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/n1sdp: Update EDK2 version
      commit: 299003f7fcf85a294cb9351abbf9f5961dd4a36d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

