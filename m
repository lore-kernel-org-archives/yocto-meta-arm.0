Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF628C7115A
	for <webhook@archiver.kernel.org>; Tue, 17 Jun 2025 14:01:41 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.19660.1750168892341478577
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 Jun 2025 07:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=srPtySKq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.45, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fa980d05a8so52780596d6.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 07:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1750168891; x=1750773691; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sfPFVZ3KXqHYyOrCiDli6VfX4vNRmZCaUY0ByNAScZY=;
        b=srPtySKqXtbYjJUctV6jP3b2ljwMw4uqn670Wii8+xIzmMNBF1vCsNT/cvrspRf7j3
         plL44HxmKY+Hb0R0lpbel3ohvRoHtzieMandaEd6zC0UnA0RxPa8eXAyq4BTE1F3tt6G
         67asFh9SLLhZ0pelHI6suaBJmerMXMiqzgrnVKXMK03nfHnlQhasvw88AQaOdibBodI9
         Mn6+YwHam5mv0zSitZGfi7ilPncyuUu8tWRGWFvi/2HoPqcClXS2gNgZHcej1ypBZyRg
         rKOecZ2TqT3EvG3ZO8kq+TX9JVULMrhPW+cvcdX6jN8C5ZrIxVwiVBPiQnxtN9TB48Ch
         5bTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750168891; x=1750773691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfPFVZ3KXqHYyOrCiDli6VfX4vNRmZCaUY0ByNAScZY=;
        b=PjjkM/R8H+J9lo0U7r6DXN37k1LXdwg0y+43CTwS7g2ydb7ke6cc5DNWy9GkYnQcQ+
         U4W8/I3WfRUnmEzmpZm2HqbOjYsAN7fjwIy4Xrl1RkdAef6bO0Q5DBt7DrKaLKetop77
         nC+Nm+Mz7f09fLkm6O59P2INtPFlMxLt70Xnl5Iwwvw2JQmEBlcig5ZrMkqcBJ5WZW1O
         RdFfdsl20/RM3H2GnzebT6LG72gYHAYPTfnJ/WgSifDteBGNea/frF6tiDaH3zeUBdPm
         V+Tj9i+/Z79Kg1N2utKzQsiNJz1IBX/u3YOueZhDlx9KVtcEjI8VyN+5RfmisJA1f0tz
         +mDQ==
X-Gm-Message-State: AOJu0YwKai0VXLUG/xk/9PdhEhfqRLllMp5dDseB7GPBhyGIMpa4MGgt
	S9leDStxHL0cb6BnZ1mHNopKObkx3XZPNVVLqdAxHyfhRXdCUkfjns0Mwufj+9ooTF16/NviXlI
	5XVk=
X-Gm-Gg: ASbGncvnl5bhJLKVj/t6qWcwaPhPSRzlcFmwiY0TgaiI7ld213wicSxvcoWMrrLIZQ9
	8TBi/cRXRltdsgIRcBf28UL8lKO3Co+dwxqagqfvupp0XpOwXSdSN/howg/fsBx0qdEG+ph9nzy
	Cplx3PYKzW+csRJc1SU7qZCA2STctZmobokPXMJrj775piUV3W8x3I+l5URv7hGt4A5w22Rw4WR
	FWvZ5a+2RbVKUVGySwzAQaNk0MrPEVzPW8sU86FN/l5SJB/7h67fD7mgUvtR4bRqPInxV0TVJ7/
	933XXDR0908XY0B+t4D5gEF1p8SUeOMtQog+IauiDeB5KVRflPVXXZds3IAQjuWG
X-Google-Smtp-Source: AGHT+IHNbxQxyt7G0JCd6ldSXdM6xkFR/gq4/jeE+IBR7RkZ0adKiHQUz4cd2fppGtUnr4Ok+UlnjQ==
X-Received: by 2002:a05:6214:29c6:b0:6f8:a667:2957 with SMTP id 6a1803df08f44-6fb4772753cmr193495556d6.10.1750168889996;
        Tue, 17 Jun 2025 07:01:29 -0700 (PDT)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20f35sm62863356d6.8.2025.06.17.07.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:01:29 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH walnascar 0/2] arm-bsp: corstone1000: Release CORSTONE1000-2025.05
Date: Tue, 17 Jun 2025 10:00:47 -0400
Message-Id: <175016884823.1970111.9684203616175987692.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250616054705.4041036-1-hugues.kambampiana@arm.com>
References: <20250616054705.4041036-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 Jun 2025 14:01:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6560


On Mon, 16 Jun 2025 06:47:03 +0100, Hugues KAMBA MPIANA wrote:
> Based on Walnascar.
> 
> Commits include:
> * Documentation updates
> * Pining of SHA for layers
> 
> Hugues KAMBA MPIANA (1):
>   arm-bsp/documentation: corstone1000: Amend for CORSTONE1000-2025.05
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/documentation: corstone1000: Amend for CORSTONE1000-2025.05
      commit: b52b4b7c4b3148bcc274cad306b9ec3ba657f021
[2/2] kas: corstone-1000: pin Yocto layer dependencies for CORSTONE1000-2025-05 release
      (no commit info)

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

