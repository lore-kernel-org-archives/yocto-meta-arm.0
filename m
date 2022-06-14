Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79664CCA47A
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 20:06:46 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web08.1600.1655237205006343449
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=x09fON17;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id t6so5916439qvh.1
        for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jun 2022 13:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=j/VRAbs5xzJ3VtvEYl0pxTLmFZsTgk1IILjBsmRlVsc=;
        b=x09fON17u48t/ttzTmJWmCQFerSNvLvBTHvGUfJ3f7GEB5UFD2vUUVxru7FF86QyiR
         P649ABvRIAnu0A5YnRUSfKuXIOrqENcSKvMtBnG/PS2tKPKL9tKkCmTlwzCM14hSmPxw
         HfMhpuJxEdvABbI3jL7MW8SnmqVMX80vg568B6Cd4Uh5dklWOQwgByr7r75foY5OGQC+
         vtK6pC/BeroyCFqCuw32XwOqdqn7A2oGaQtStPZXQWGYKYKO7wil9WbTngzSqgr4eBWK
         8lgYO3Oy5jTD4NcKXgXToqEu/Q5wvhKxugHiYgYPzvNkY5MNNDWUrGwb7fzvLrlp+zPV
         4TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j/VRAbs5xzJ3VtvEYl0pxTLmFZsTgk1IILjBsmRlVsc=;
        b=k4osbuUYadWL7BOPRQa0NMxHXjFK/Q/oXWKPGBrDkqnjv8ENczdrNQeB8Y8k/6cvhd
         TKQjiznjqv36U+TYCJUyhEXhNvrQ1lMSlRBfbUZRRRqiGllVuz8z/OOhgXkTFpAmsDsg
         Ta+83ZKiS3By4RYdT3r93LeoVuY3exS/bp/j1Oy83fy4R0jisIM0QgHpDpWFm/1KAIKq
         LdQtBAn3Qa6p4jF7A1eDLNOiEBbtXCMEsv8g84W1hSQ8nPiAVwWJLdw7U/7lDHDkeXSr
         di7Og2zInYqXjKob0BGaMcswy3+oMeAN/uYf2NGcQxqWKT1c2hmvp0XK+XUORrzOVAuz
         JdFg==
X-Gm-Message-State: AJIora/zKZMT8y6BVfej0QDzaqisqsOQm/ClrHVk/kkgPhK7S5Eq6MMR
	ysXgrZB3DCp2NqR0sR+Jzwpuq6Dsuau3mA==
X-Google-Smtp-Source: 
 AGRyM1uvXlT9ExgocjOZ4jIUzZK8+VabeAhVh7TK7cUPlodWZ/xhq8dc6kDeicR40NPXztb3DvYRiw==
X-Received: by 2002:ad4:42ce:0:b0:466:c14d:5713 with SMTP id
 f14-20020ad442ce000000b00466c14d5713mr5130212qvr.38.1655237203762;
        Tue, 14 Jun 2022 13:06:43 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 x14-20020a05620a258e00b006a8b6848556sm2810525qko.7.2022.06.14.13.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 13:06:43 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/trusted-firmware-a: Update to 2.7.0
Date: Tue, 14 Jun 2022 16:06:34 -0400
Message-Id: <165523719573.643054.4767209304485785073.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614175712.330-1-jon.mason@arm.com>
References: <20220614175712.330-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jun 2022 20:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3499

On Tue, 14 Jun 2022 13:57:12 -0400, Jon Mason wrote:
> 


Applied, thanks!

[1/1] arm/trusted-firmware-a: Update to 2.7.0
      commit: a355384290ecb7f00a7aa9a89e3722bd73499791

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

