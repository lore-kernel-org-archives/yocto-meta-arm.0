Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D329C83F15
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 16:09:07 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web11.11094.1693066142509154162
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 26 Aug 2023 09:09:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=o7yokDy4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-410994a240aso11675461cf.1
        for <meta-arm@lists.yoctoproject.org>; Sat, 26 Aug 2023 09:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1693066141; x=1693670941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3TsF5QIk6caoT2wLDJTPIq2G2M7nFZlaJF+0/gMD5wE=;
        b=o7yokDy4+Go367/tEzCR1V+zurVmyMIw/69aySHp+M0tlvglSR/Jkrew8UOK72p2PI
         XmBp+f+0/cB3XUXF0rcSywK0ZsE8Wd+5JidVJZ1Bk4J+n8JDF+uFJj5gtLFNxAxbfCgt
         tVf1TPM6aNM+BZ3RsCxkOnivS4O1I3dT0vaDYMeIMkxD5E1V7KI36invl6qnuTtlv63z
         Na6OT1N8lSRWsDtaVbIuHYM2ETGjyVd62Obnav8k4mQNkpo8djkgnxsK9idaBoQhIJ4B
         DYaU7mbru5/eLJDjvGUaRp8YCda7KAfs70sMV4tYQDB3m6ydPtuIz7slvfW5eJzcQzpZ
         0HSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693066141; x=1693670941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TsF5QIk6caoT2wLDJTPIq2G2M7nFZlaJF+0/gMD5wE=;
        b=grTrPznlyWodGRqQVTEEwJtBYcwpCO1s3LotHrYfxwCDzVlxrdwRJQb1KSiKrHaZW1
         /z2Ib29X+7y4CM2w6RjeAUA8mxT62F4Z1mUNf6MRArRDUBiDDoCEBJ9/aJYahwjxjVW9
         d+lVTJuTgE2fdnc9CVfAwLAF3kb9QgfPqnuWhs2fZfNuZye40plSYuTIPKLu3A06Byi2
         T6b77RBxJNzwlf8AuEgd3HfdoNifJzfYY2cxuTpxY6lVPLGTHoilHGmg+bpaK+rbGB9O
         wykVlOb/K0jgkUeJfMej95v19zOS2pWx1OPxHkcDbIXikSIis7Kf8grskVyu3EIJBmnQ
         jwoQ==
X-Gm-Message-State: AOJu0YxQ9D6OfsRz8RZb2a3esMsVziBBFVeWFHq+I5xvToENbFO+pGHM
	FH1/6ZjaqyWon+29CXuyQmjuGZWd9bewL/AmyFA=
X-Google-Smtp-Source: AGHT+IErXRfVDgC6usrDuXPY2ApUvl4/fmnzl4bkvqCxtUPrxkfws798DvnuTa6uNP2nzKs+SYNrcQ==
X-Received: by 2002:a05:622a:510:b0:40f:ee92:fa83 with SMTP id l16-20020a05622a051000b0040fee92fa83mr23905926qtx.28.1693066141080;
        Sat, 26 Aug 2023 09:09:01 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id c27-20020ac8009b000000b00407ffb2c24dsm1191248qtg.63.2023.08.26.09.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 09:09:00 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm/hafnium: update to v2.8
Date: Sat, 26 Aug 2023 12:08:32 -0400
Message-Id: <169306611265.2418.10859388056755857030.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230821194739.3647180-1-jon.mason@arm.com>
References: <20230821194739.3647180-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 26 Aug 2023 16:09:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4997


On Mon, 21 Aug 2023 14:47:39 -0500, Jon Mason wrote:
> Update hafnium to v2.8, which allows updating tc1 to that version and
> remove the intermediate SHA.  It also allows for the removal of some
> backported patches.
> 
> 

Applied, thanks!

[1/1] arm/hafnium: update to v2.8
      commit: cacc36565a42be15907aaeb2ca29a7497d1735da

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

