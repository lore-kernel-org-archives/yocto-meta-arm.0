Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 072A7C64EC4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:31 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.255.1676608276359414894
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Ylf9eip8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f178.google.com with SMTP id h24so4417995qtr.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qss1uEHpEURNb7G9tSDP/4YUx7q06kR0+BZvuIEiP14=;
        b=Ylf9eip8rSguT+b29PWJSUKyTUPPLROc07TQy6o1OtCEQD6lat/K2ihPb92tcOAYFl
         VxXsZGwhYKTx5cE0gzyUE01zi03iZK31+nlS6QbVDGO+FcNu+6U9dw+UAHkEq5DPDLCU
         1/aMPNXvmuJiIblppvhLnjWNYEFiwkuGxfnhcZ00lZA1jcbynIPhbZNQ2pNf3HGVNj1u
         FLYJkWTnAEcVM5JzU0LvQXB+0ei5zrxT5mykH60XZGcdKNCEmcRE5/DTHrYVhfaANxBg
         CTYZCZkmL2eGRI74DhTMSJDSy1Qsv2yX2nFS9cgt4RmiICa4R8vU+jc1YiP/FUGotgVj
         uQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qss1uEHpEURNb7G9tSDP/4YUx7q06kR0+BZvuIEiP14=;
        b=i6XeoJR7JiG+9ChvEdFGiW/BnHNhY/TRwQi9CVKuAO2DAN72tEkPZFmUYVeZ617g2z
         juwdhXhzOwdNmTroMegoCyZmLJ+nG4ny278ylybvaBNPO6QT40fqKqCST0/crD63c419
         pfzZmJJ+nrEedgnVtZvAjdtHUSrXyk/Uy/IwsUMNbO2gc/wWczQOuCaYnkb4BG+a88jh
         9Ab9fHMiCz3KRDBiaD/6bPX5H2i5Q7XAx5oka+cKmw+NuKalacwvubuF9tR1s1aAXEdk
         aoEj/QODSfdx5GdV9gM8c2x5DOXVv1sxjlpOrHz6Nr6VAXAXu1xHW7CRd7l8e7V7UGt+
         HtkQ==
X-Gm-Message-State: AO0yUKXW/rEHMXuwd1/om58TXcAFrmreNnnWXV2shhtR/t+czIQDpvI3
	bY/9cD24aLa2FPh5XKghyqhzjkhyizAel59G
X-Google-Smtp-Source: AK7set+2KNlPrF5cHpyeFndJFj1be5rBUHbCjiwd1UubaBeo60O/EVGCxcDVrZ3CSjK7+PdG4mdNJA==
X-Received: by 2002:ac8:5d91:0:b0:3b9:c352:640e with SMTP id d17-20020ac85d91000000b003b9c352640emr13910355qtx.46.1676608283428;
        Thu, 16 Feb 2023 20:31:23 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id x1-20020ac81201000000b003b9b41a32b7sm2511754qti.81.2023.02.16.20.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:22 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] linux-yocto: Rename 5.19 bbappend to apply on 6.1
Date: Thu, 16 Feb 2023 23:30:55 -0500
Message-Id: <167660825902.685488.9739498976156867223.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230204231120.3380708-1-raj.khem@gmail.com>
References: <20230204231120.3380708-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4418

On Sat, 4 Feb 2023 15:11:20 -0800, Khem Raj wrote:
> 


Applied, thanks!

[1/1] linux-yocto: Rename 5.19 bbappend to apply on 6.1
      commit: 557e89242eafc19dbe394403619a5a45cbf95142

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

