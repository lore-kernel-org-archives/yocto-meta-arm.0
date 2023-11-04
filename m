Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50AB7C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:19:46 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.3648.1699067976834075372
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 03 Nov 2023 20:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=sz8C0uJr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-41cd444d9d0so15564961cf.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 03 Nov 2023 20:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1699067975; x=1699672775; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/p/xYik+v3anQnHByNllmey7pxxpIOoT7411QjqPmw=;
        b=sz8C0uJrNa2oPyiFtSpKVtA/DithyN8TqOsOYBimBeqUvYqIdfyYYTSL12V+s2XMSA
         wqQbWntXPEpGqFKI1mOdFn2oVKWSt30r3xi8NLkoLaPeXR2En4gFvwrQlVH170wgOtCS
         GullqXO2CmjQnhozhfUGfcd3OshLu3IddwNJhoC1FO4EO2DjbIu70ZB9bDRBM9XYNpED
         sxWBEURfcRGBj09Q/v4G0FDSmMyFHQA5qhBH8bNu+HSHdkTG6gz1DPTu10Agch9RiIuV
         /2NjHLFiELsQk/Vx+Gm/pk3BbbW4S/ejNXm6rUU18y4NQ8uoxl9/LnKnnNiRZRwQqHUy
         ZOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699067975; x=1699672775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/p/xYik+v3anQnHByNllmey7pxxpIOoT7411QjqPmw=;
        b=CxK8v7fgokiDsjBjYFFwILXnjoQo1fWHHWamhrebePef5H6KcNSjs+HFna65Fq677v
         YaIEQAZH9XXCluwkzjysMbcTKfKRdNJBCAd78rCJU3W4D5lX4cyPvtpmyw+XGuGRHvr9
         6wyqegvoOMqskS9e1yJOxtQB1nrYw/EEPGKTC8Y0UJ+SeXoulreFP+i5nnmWiUQ6oJrt
         +M/wAAyt2KM98gCynfBB6iJV/jW+hB5kxJobBe1w/GIWHD5AnL/wDS4UKaJW63oYIPo2
         X4q3Q69tUVizzZV6n32UjQVjXSjjx/CJeKdd5gPSDU9FQx06gM3nkzIZ9tGZykg4ix8o
         zAgQ==
X-Gm-Message-State: AOJu0YzkYLfSPFYKw2pH9r3HyG8Z0AKz7Dye8bVsZPBoS+AWxNDlKTcU
	OswhSM7EWxU/4z/CDc50vUTn9gIcVBmcyAxEdI4=
X-Google-Smtp-Source: AGHT+IGgCEqSsQnZSSwPmqF9cZbVAYu1Yrl0IeaMtSoMER2LvwCE1Igev/fmJcYO9biWzyWGIWuc7w==
X-Received: by 2002:ac8:7c4b:0:b0:41e:1c47:50c4 with SMTP id o11-20020ac87c4b000000b0041e1c4750c4mr26616249qtv.60.1699067975174;
        Fri, 03 Nov 2023 20:19:35 -0700 (PDT)
Received: from localhost ([2605:a601:a688:2c00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b8-20020a05622a020800b00419c39dd28fsm1243289qtx.20.2023.11.03.20.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 20:19:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] arm/trusted-firmware-a: update mbedtls to recommended release
Date: Fri,  3 Nov 2023 23:19:03 -0400
Message-Id: <169906794307.2452233.4318556179554859904.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231103195710.3829785-1-ross.burton@arm.com>
References: <20231103195710.3829785-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 04 Nov 2023 03:19:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5205


On Fri, 03 Nov 2023 19:57:10 +0000, ross.burton@arm.com wrote:
> The TF-A 2.9 documentation[1] says that mbedtls 3.4.0 is the recommended
> release to use, so switch to that.
> 
> [1] https://trustedfirmware-a.readthedocs.io/en/v2.9/getting_started/prerequisites.html#software-and-libraries
> 
> 

Applied, thanks!

[1/1] arm/trusted-firmware-a: update mbedtls to recommended release
      commit: 5a7db0ae6645fbe0b32ac20bd818528e3836ff73

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

