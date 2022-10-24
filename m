Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C09FA373F
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 17:37:20 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.344.1666633032518934548
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Oct 2022 10:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=HCWlWrRy;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.175, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f175.google.com with SMTP id g16so6046285qtu.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 10:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ONkCMVYrzd2aGdT4AKE476viOQ+/l1wjdrlvzExoRaA=;
        b=HCWlWrRy7Es1faeTjE41crofL2tv3zjjwDwYGPPdYW6eZiSQYXbAHTtUl5g/syuJbS
         U5235fLzvjKURjMj+m3fEhdZIlqW7a9RiGhH6DAtBF8dklBNjzClDKNmkgPSClql6WCo
         gHyPYBXg2YbqE+3s4csJ1kKmlRUWMFIdnr+6rSvqhxXjWxoyo0ao6pRqnV/3eq1mhnXr
         FkuA2f+ofpLyyQYpthnlQnLI7KgO4edq1TIqwaxjkLgw+wx5ewUo2wP7R8h37JuY5R+E
         i1CNVCbgw5Jsk6R8RRy2VLgHS6SLGzyWBNjpjVnyfc1T8xoW9Xn5JbSNU3P8HIEsnSZM
         67Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ONkCMVYrzd2aGdT4AKE476viOQ+/l1wjdrlvzExoRaA=;
        b=NZeIoiRM3zzHK2AwoRytBEf16+pqiYTxlnj9t9rYA/FigmjNeXmLo/qc6o0krOUDqS
         mg4gIZdsnhTGuzc+aed/YiM45Ot+KwLZa19rfnxshK4dNJ/Pc0dHqRSZnavwi/Bx6iul
         XjgkdAnGvN5Ref4Fab/d9E59CNH+oEPzZRVOTHEU2qAuRkry55J8TfV0ZIaNh0BiXRFj
         6oe0Ez0PQMSuuHkLyohQPyurHAfuYDPTSiLeotScVGE+S3fCkGZ67q8NQ1IbnxiyQ6BC
         bfwjl/zME7JZkM+XuiUS9UM6e7LytWDwb+sJ8bCAtC9hf632qYxqNPMdJSG1Flo2CIBN
         kJQA==
X-Gm-Message-State: ACrzQf0PAykDIUkhQDg4bKydAx0/jgca61/IMCHRoviwRimZzU9oMsPO
	cErT44tRh+K8oFZwH4bMOaA65zfZePEinA==
X-Google-Smtp-Source: AMsMyM40GkUTrX3WPZWc3F0blAI6rnmmHzLm0sAmIFaX9mgHiNIVxjDkqUZ+yMXcRV4FJogpbVFnTQ==
X-Received: by 2002:ac8:5b90:0:b0:39c:e9b9:c002 with SMTP id a16-20020ac85b90000000b0039ce9b9c002mr28373585qta.3.1666633031190;
        Mon, 24 Oct 2022 10:37:11 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id j6-20020a05620a288600b006f474e6a715sm283287qkp.131.2022.10.24.10.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 10:37:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"mohamed.omarasaker@arm.com" <mohamed.omarasaker@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/4] arm-bsp/corstone1000: esrt support
Date: Mon, 24 Oct 2022 13:36:37 -0400
Message-Id: <166663299865.2899578.11332338053782201963.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
References: <20221024133330.10542-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Oct 2022 17:37:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4032

On Mon, 24 Oct 2022 14:33:26 +0100, mohamed.omarasaker@arm.com wrote:
> This patchset is reverting bumping the sha of the TFM
> and only appling the necessary patches on top of v1.6
> In addition to a trusted-services patch to support
> ESRT on corstone1000
> 
> Mohamed Omar Asaker (3):
>   Revert "arm-bsp/trusted-firmware-m: corstone1000: secure debug code
>     checkout from yocto"
>   Revert "arm-bsp/trusted-firmware-m: corstone1000: bump tfm SHA"
>   arm-bsp/trusted-firmware-m: corstone1000 support FMP image info
> 
> [...]

Applied, thanks!

[1/4] Revert "arm-bsp/trusted-firmware-m: corstone1000: secure debug code checkout from yocto"
      commit: b4dfea8e28784bc4fd4183eeef050feea0efc716
[2/4] Revert "arm-bsp/trusted-firmware-m: corstone1000: bump tfm SHA"
      commit: bb02720fd7bc45e3a0367bb77ae54e8bb50c4c32
[3/4] arm-bsp/trusted-firmware-m: corstone1000 support FMP image info
      commit: 9e17830b846c6197893ef121e899d327da104626
[4/4] arm-bsp/trusted-service: corstone1000: esrt support
      commit: 952dee0de9b03d3cb43ef29dce3935a868acf2c6

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

