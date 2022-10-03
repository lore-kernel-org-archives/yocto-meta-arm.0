Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC83C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 23:57:03 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.4794.1664841415357335677
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 16:56:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=MBABbN5b;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id w2so7316978qtv.9
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 16:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=nredPuWy3xehmH25PdcGy7XFmKnOvtjCiSh0IJoqsac=;
        b=MBABbN5b6Bsh9Z2/TnktytiuEzrNFMtBcTTNXTKoJsuCqIdlP3sVY7SUbCe8y55tQL
         RjGbCIcAxHVRHN4iS/L02yTLql79zvpQcUJgYsCA9PUdv1Jt9RxzCpkwSNn4HMpVZxcS
         grxDbxl8olaD3LiuJqkeE5BZgaYDmcdvfGq6DAriHL3Yyqa6JGiQLWCqkESlZzdkhUYj
         eGZ8KUPg8PtRjzOA2fBDVPHDDPCq9NuAUtCtnV6W2T8v8wGsq0ETzsehBxVzGYGC8ZHH
         UoAKyqqScpYIOUn1sv1yNZx2Z7oWry8pzSBIBPtMyRnPZSuwylEfIT6JJ3TVD4pPQYLT
         OqPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nredPuWy3xehmH25PdcGy7XFmKnOvtjCiSh0IJoqsac=;
        b=gmCY8U49LtosPYAXb4J0GravdpqRywPSEtPF7dHWNzisHlBUM/pnImK4PbjmOUE0hW
         p5WkQrvZrF5BGZn9LjZXsqrdOOiCJyKW1wESBHbVuXhscDQC1FagpIlZPK+1ebPnw9lq
         Y5Re5KLXkqYUrhbFgFz9AhazsVCTxVO4pp4vd7N1GftrESTfWOqB1YnqGpgVS2JbrJAT
         K3GYlFmxSpW6Aso1P16lXj1zR9nWsm33z+BWaSGcAfiqopxVEgId9OrTZHZgXHMdMwZe
         JTcHSLMnnJWP7BiGoWylZctjuZ9yYLmdMJ3SmD1AXB6EKVIyCcrDZtJnpwb765IQg/xu
         P3PQ==
X-Gm-Message-State: ACrzQf16SluTRa3pk6XHfE1pp83vchG9lf8fzNWhFE79Wbl/T8BoyxG4
	PhMvFMhgINDQo1RzsrLUB9840FbJ6lDmDg==
X-Google-Smtp-Source: 
 AMsMyM58SX2gs8alw9W5hHHpm2Uvapd6ktU8ZAGs+jiWTM3XPb5WBMTma6cV9NeHFwCiFFh3T8UUUQ==
X-Received: by 2002:ac8:5884:0:b0:35c:d949:30cc with SMTP id
 t4-20020ac85884000000b0035cd94930ccmr17393812qta.528.1664841413832;
        Mon, 03 Oct 2022 16:56:53 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm12812467qkp.106.2022.10.03.16.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 16:56:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/2] arm-bsp/fvp: move the fvp include file to the include
 directory
Date: Mon,  3 Oct 2022 19:56:35 -0400
Message-Id: <166484139603.4088497.7356255837180882686.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221003171600.24454-1-jon.mason@arm.com>
References: <20221003171600.24454-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 23:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3914

On Mon, 3 Oct 2022 13:15:59 -0400, Jon Mason wrote:
> Move the FVP include file to the include directory, matching what is
> done for corstone1000 and other machines in meta-arm-bsp.

Applied, thanks!

[1/2] arm-bsp/fvp: move the fvp include file to the include directory
      commit: 6655928c81517513b557dbaee555f564ba21044a
[2/2] ci: move features only needed by testimage from base
      commit: 6983e2a2a99ecc502893526a87ec6b5b9e6380fd

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

