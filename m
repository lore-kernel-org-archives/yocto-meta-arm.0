Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A4DEC77B72
	for <webhook@archiver.kernel.org>; Fri, 14 Apr 2023 15:15:42 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.12813.1681485332865936380
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 14 Apr 2023 08:15:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=3o3+i+3J;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id z1so8772061qti.5
        for <meta-arm@lists.yoctoproject.org>; Fri, 14 Apr 2023 08:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1681485331; x=1684077331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MWmZa/F+c4PB1yWXcxfylu46l79YFaFEd2Xn7JDZZY=;
        b=3o3+i+3JNRSIL7prZK1XDANzpNfpfMQiJ1/0YQ0CunZG6owrNkbTTMvZ3Y3qrv2gX8
         dorMREbDyhrrZHoaaKZGj117OrPUXjuAT0FWgdmekcuZHt9mraw3piTTYdAFfhiFrt+6
         i55BNLXHbJdlaXlUl+5jhMHPJlf0RSm0sq2SS9eIO0pVOOeoEQ0sSC6Q0vbx9d7pSgL3
         rLiJnoq7/73OjpAWqEsbQacrU4hvLiIjVi/0D2yJFq9X3DKMXgvEiA7XhGSUBprQcL5W
         In8wv24hKbjxhvBm3xuZoWPThs94FcTXxh3KmYpt0EvEbeQaw7dYxDR1L/SW9Ec0fdu+
         sGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681485331; x=1684077331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MWmZa/F+c4PB1yWXcxfylu46l79YFaFEd2Xn7JDZZY=;
        b=DGuMnzWsP/cNd75dfRMNhTrREZASvy4Xng02VuV3b9MwY7TVtq8EJaVXoEHUkRYaGB
         CiKu29rsnUm7FkLLP7pAJCSxkoJwN9LoXk4byj6vIG5//ySnIW8RUPMzxUtciBAkwJQj
         p/GDJql3v7hyaIgo3DO7/DRI0HSmlCw/dDHJmwMGxsFrCk1+uiZlvKoFoGqbkKTUF6NY
         PDRiCi/S744NHzuE49lo+EoU25S2C2FAWQt8The/isTKbleDjKcdYksd/VFr62lOudKn
         bo2w4DWI9HFm0gGS9rvA/D2rnuXJ59C1qx5YIzLkaJTqWy5Zgw1cYgmBO/cxN22g0Q1B
         bjig==
X-Gm-Message-State: AAQBX9dh9cl/WD5NIXwM26ggq6Z4Yzd4r+nj31tnYCS8I+wdabbCMRAR
	8RePii/pn48F1QWPDnoo7/ABTl2hl5MByLMwcnE=
X-Google-Smtp-Source: AKy350bsC7lZ7E5CxCW9cNOEiST6Ks07ZfAOkNCEZ5I4+6Srwblz2IgStFTDqpI8PuZIgjo6/TSVSw==
X-Received: by 2002:ac8:5b53:0:b0:3db:786f:d91a with SMTP id n19-20020ac85b53000000b003db786fd91amr7983294qtw.57.1681485331541;
        Fri, 14 Apr 2023 08:15:31 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bm38-20020a05620a19a600b007422eee8058sm1269947qkb.125.2023.04.14.08.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 08:15:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] CI: track mickledore branch
Date: Fri, 14 Apr 2023 11:15:23 -0400
Message-Id: <168148532294.2404803.3420851795184502350.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230414145745.613135-1-jon.mason@arm.com>
References: <20230414145745.613135-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 14 Apr 2023 15:15:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4578

On Fri, 14 Apr 2023 10:57:45 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] CI: track mickledore branch
      commit: efa053885f63a82618cf14d9bb5a1143d52edb9a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

