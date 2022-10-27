Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95541FA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 21:38:40 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.3207.1666906715788834975
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 27 Oct 2022 14:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=hIEOuwca;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id b25so2175676qkk.7
        for <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 14:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ZPAN1zVsh0wtVjbIGHzIKvt5/d22MCqi+HEniLDqVQ=;
        b=hIEOuwcaLS1T5oHEVT10zQ+5QyWwOiEuU4iPgGRoftnv4o7xfSkQQqhoLRx8d1Ii5L
         AkwMJFTvqN4VAZHqrTo00B2Xx/oMz0fzZL4Q9qzXmkX0GDc3OCEFOlRAIysdXWtviXxs
         3VHSv4HsnG9/YWILGJe00c+D0bEuzhU8BHYv+TVG8hF9f8m9Ku9MJj+IlaaSB1KyA3Rl
         DfaQDConnYzaYI9/QuNi7g9g7cYnngiz1vXWccwEcTNYIOYTdFx1tLiC1extuVJFa2ir
         w+Yg+vMFYGVG/yegeBSeccC3mkJvGnU006DgvqI6fdH8THmqUIGlWxeXA4pKIJJTO+Bu
         gdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZPAN1zVsh0wtVjbIGHzIKvt5/d22MCqi+HEniLDqVQ=;
        b=aYJ/VoaQYrsEZPoQqNV1AeMWbxZCvKogfyEi51blLdGoEI0a5VSJKc28SIZTRBvj/3
         P2aPO+kIYnft4gRTFsgBCuUetpjU4b37vp4O9FfNJg7H4mULsI+NBqvt1zilEXIqL4GZ
         pt5Us3CNX8leKn/xWsGofLveynVLIspRcDZPsOez2D0KgmNXHUjJz6tXeVoeefJ1imu0
         F4LnqBJ5JVOJbEUsk+qTC5+Lb/ydoX30hPMhHnH7CelB7tSNh2378TqXKMm0MFZ3l4nv
         C5R6SW8gneG93L7KsUKTWrTnJdfBCvybSwJR1X0ebfkvOU/H/nCz8OBhyYsXCQmcOSj8
         2Cmw==
X-Gm-Message-State: ACrzQf1nKGFcIwCg48KseJzBsfZKyngjx3YvxTx4WClecBl/DtO697lB
	chkWh7/o6JEMIjwcguiRGJgold9vKIFWPQ==
X-Google-Smtp-Source: AMsMyM7WYUqYZ+qEo0CgPpPdBovWIdJsdkxWgDkJXWqMEY1xsWmUwKlLW9MqQboT078n+ceQncB6Vg==
X-Received: by 2002:a05:620a:f12:b0:6cf:bf70:9ee4 with SMTP id v18-20020a05620a0f1200b006cfbf709ee4mr36930090qkl.608.1666906714291;
        Thu, 27 Oct 2022 14:38:34 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id x2-20020ac87ec2000000b00398a7c860c2sm1476503qtj.4.2022.10.27.14.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 14:38:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"mohamed.omarasaker@arm.com" <mohamed.omarasaker@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH langdale 0/1] arm-bsp/corstone1000: add msd configs for fvp
Date: Thu, 27 Oct 2022 17:37:55 -0400
Message-Id: <166690667490.1722080.1294106638720238217.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027102836.649982-1-mohamed.omarasaker@arm.com>
References: <20221027102836.649982-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Oct 2022 21:38:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4054

On Thu, 27 Oct 2022 11:28:35 +0100, mohamed.omarasaker@arm.com wrote:
> This patch is to add p_max_block_count and
> pl180_fifo_depth config paramters in the fvp machine
> config file
> 
> Mohamed Omar Asaker (1):
>   arm-bsp/corstone1000: add msd configs for fvp
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/corstone1000: add msd configs for fvp
      commit: f312adf47b46b659b5389e6bbd4f21c023b04787

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

