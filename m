Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FC4CCA47D
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 16:10:03 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.9143.1655914195450135111
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 09:09:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=T5HA6dvF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id c1so25424902qvi.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Jun 2022 09:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IjbnY9YByVu6YkFSKxbJNp4iWaMPbxF5BfMeeT7m62U=;
        b=T5HA6dvFEjM3xY8THNSbT44XzAvZaLoLMHMrG0cio+Fa1t3nBhQl04SypXPLvmnJDd
         M2J4W9+kLjnKcqPyJn+SjzoSVgZcQ16Sv9eU4OaFKnY1EYpvOBAuGM9LfJoBMXwd8QCo
         ZY8Y7HMz+aUkSChAv5oZSjIFdKfqivYmgLstjCwQxjIh55CgUMnyhxIhutD8Fn6P903f
         KKB19Nig3QTYYEmGFx9rRhfaVKzZeT7ml6jGLvrcwSWWBm3ZYbeCBhbvGfbL3j+sDxhd
         EARpVnScU7GliUcmINaZE1qV8xu3b/ezpNtbqKDl+XhkuUw8uX5ELz4hm4/cavG59tDW
         58+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjbnY9YByVu6YkFSKxbJNp4iWaMPbxF5BfMeeT7m62U=;
        b=sC8IU9P6ixp3VLn2b8XBOd158cQwBwI5by3PrWP9ln2M3JnPqTRQuIl+2xKhKZP3nm
         q0BcYfQTVDTXzOy1t3MFINDBlxjIFJCPxEIptPzOWnWacKmoec1tp8nS/fngnPWoWp1/
         o6vllQgTNpsNFuGXgU1ri6+StXDEKwY1zKLnWU8FOVrUp6mo3Ew//6YUK/O8YDURHkKP
         SNkT1lDfrzXbezyk3smgJSifbD/zlO/ipNHdiZeqD68pusKKBQI4Ilw2VjdDqvxUT4+O
         YAOEEpyDo0lBt5yjX0kyfpfd+Tmb2Du5pVYG7Fj7D2bJ+3mlgP1WI1bMJ7pFFrXrSg2p
         Y4EA==
X-Gm-Message-State: AJIora/H2pGzRehr09DgFvTZF6wJBfdY/YAm4LMXW6hlkN8DnHoeH9wo
	V3wNQR1B6azPetR45GrlkCxqg86YFbAB+w==
X-Google-Smtp-Source: 
 AGRyM1uCMLaM4M68sv2aUcm/lP1xAsOgBPCBh/6KaE4dV2bNJ08ISUggcLfhW3hs96Fs3t33A2swFg==
X-Received: by 2002:ac8:5750:0:b0:304:fcfa:67db with SMTP id
 16-20020ac85750000000b00304fcfa67dbmr3730358qtx.249.1655914194152;
        Wed, 22 Jun 2022 09:09:54 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 hg19-20020a05622a611300b003050bd1f7c9sm14505265qtb.76.2022.06.22.09.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 09:09:53 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] ci: work around zephyr test issues
Date: Wed, 22 Jun 2022 12:09:49 -0400
Message-Id: <165591419005.3734229.7933096205810508620.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220620150246.3171-1-jon.mason@arm.com>
References: <20220620150246.3171-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Jun 2022 16:10:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3531

On Mon, 20 Jun 2022 11:02:46 -0400, Jon Mason wrote:
> zephyr uses icount to improve test accuracy on virtual hardware.  Do
> the same here for the same reason for the platforms that actually test.
> Also, the common test now appears to work for microbit-v1 and poll doe
> snot work for qemu-cortex-m3

Applied, thanks!

[1/1] ci: work around zephyr test issues
      commit: 658de4e5e266cf3542bc88da4519f861f75f07a8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

