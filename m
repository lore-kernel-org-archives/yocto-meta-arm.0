Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A1AC43219
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 15:24:13 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.8774.1652801051465650916
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 08:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=yA2GddEg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f180.google.com with SMTP id a76so14774664qkg.12
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 17 May 2022 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P0wDu8k/nQ9Rg8AUMAShqmQDWwFDxMxYGYDQlaY2cwk=;
        b=yA2GddEg50LHcWNrafNBct+ye67EQ3qFrGtFgo1inHa/OvRkU40eXcZmFS5RzdkCbu
         qEvycqtwy4ENwQT63Js9Wvy0Su/D9mXaETjO3GxDuOBSfp2qhNl7ZqKGGwBer7iUwTdm
         JfWhYfELNdjeJA7BsA9XWTM5+5HwI6buu6vNQ6CX1dUzkFibHtQTz4R4NwgqrvA8cOXx
         K+X9zeuKnIajqZXg5mP2tX5BrBsfA2qvtBjEMvgEE+ssDEWtrIiLbcI0eYRIRsdhjnU6
         OEKb9kds4QdyeUeG1cHBi0aTty0bh8+i2urmPIFlEceA1AM6Dlob6+PhOOIPhe91/nJT
         rb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P0wDu8k/nQ9Rg8AUMAShqmQDWwFDxMxYGYDQlaY2cwk=;
        b=LoFMe9ME8xTVhbEheQ0MrSdmnLhs321/dIblzD6knI4w+bS/EOBJ+rKZ92QYWWfk9G
         eq6x8sPMSC8CplNE48d2UxYAcu+ZktmZVxuR8H9xel8+7gRpehNlH8l3klP0c2E8qW8x
         2o2S92COSKgdm3tJ615SEFS4CBup9bU4TpQmhMpWDGSy9v7fJRZ2wl0k8gScsfrRVDDO
         PCI7O359II8MU1zWy+p1J2q9APRFbdL0Yb91ekYCxhf+6xss4RzCd4nfhIO7Aw/73zLq
         9F4vOlI9HB+6mSyqoQl6YpaBBvxciXwB2FIGo5RKTKExia0z/Uo128L4HbgPInJqG66m
         OwJg==
X-Gm-Message-State: AOAM53170IdIaVfI1kaVnzjs7LUntOay29yo565/wWp+JjdGj2qdcy2O
	Kp4X0OVMHmIG5gaeuSTJd5Up3V+AGAuU/G9K
X-Google-Smtp-Source: 
 ABdhPJw1wcM01f8TnLDKKV7DYYj6k5lY7nPztqpjr4eVU68zCbUPfkF9lXUZzvzDhsw4yzDPZp6GsQ==
X-Received: by 2002:a05:620a:666:b0:69f:bbd4:b9af with SMTP id
 a6-20020a05620a066600b0069fbbd4b9afmr16480686qkh.11.1652801050500;
        Tue, 17 May 2022 08:24:10 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a05620a138c00b0069fc13ce1d4sm7424770qki.5.2022.05.17.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 08:24:10 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] arm/linux-yocto: refresh skip-unavailable-memory.patch
Date: Tue, 17 May 2022 11:23:50 -0400
Message-Id: <165280103077.3622764.17544723664355992801.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220517103112.3058441-1-ross.burton@arm.com>
References: <20220517103112.3058441-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 17 May 2022 15:24:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3422

On Tue, 17 May 2022 11:31:12 +0100, Ross Burton wrote:
> 


Applied, thanks!

[1/1] arm/linux-yocto: refresh skip-unavailable-memory.patch
      commit: a3a6597cfdda699c65be3c2bd8370f787193c450

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

