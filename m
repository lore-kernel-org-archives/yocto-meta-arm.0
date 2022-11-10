Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6382AC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 19:23:30 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.99.1668108209057835796
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 10 Nov 2022 11:23:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=Tr52LCKD;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id x15so2125623qvp.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 10 Nov 2022 11:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a+Ciz7ymYqQ9tMFkll69MIe2Qpa4CbxyHGGnyFzO43U=;
        b=Tr52LCKDPwf8wUv4/klaOfDengiZ863InNn/1nbTDpjcjX6hqVrwcLGtpUScREU0Dj
         C0Ql1AH0ZF6ojefCTkI6qXUKbpDHVVSv4VAVED7OpQEFZRGoNbX2c7kq/7xMY69sgJ0d
         awrwIejR8tyv+13XeXShuFJnVjyf6HUeHpObn+ICw+hyr8wY8OzKxKBL9RBOHgti1F1L
         +5Cm5J+CxfHVEwbQu3rawSF21rvziIXm6A+y2cgAhgc7CpiW2erW7Jw6/a9sM9/4JYOw
         Qlqb2KRspygNFiJpA+oIytocvEEIUGbalzgcWHnbOxYs3fqFzFQmTEePW3D4EAJHs744
         KoBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a+Ciz7ymYqQ9tMFkll69MIe2Qpa4CbxyHGGnyFzO43U=;
        b=5bX5kfM2Zxno4JLXvxkfPstzDu//EfVhOlZLI/hJds54V5W8N872A1hPXljj10XUsi
         5D4m06XAeTVySlRa6uTeF+s8qEST2NHbVfonAeIKVuYaB+ewsIEVYNA02Oh8qfCwRJGY
         gFmuAG9Vo1QLY5zIdVh6TfoYqVmI1x/ei5kH4c5HXHwn5hKfGSfQSCQ+zWZfa5p6bCYF
         FRLreAeeFqeKuYsuY33+u60uV6u3hJb46LisoKc01ZcooL0raepjjszzmfNG6IHMRJJb
         U1UvE3fdOmzyAwnLhmL3RQl/nZ9UBvXybbk36xORTzdpbb2bhAD1TyZGrJOsllDn7OOi
         qP7Q==
X-Gm-Message-State: ACrzQf2e//naJv//uLCnQpGuAhdV2MifmMkdhkgO6jQdgjDcqm3UKX0m
	q2sO1Vp/LxCmMS5rHp/H3eSaaw+uWTjq7w==
X-Google-Smtp-Source: AMsMyM4/cFrG53GfcqlE4DudteNoX+ehgFHg9ctuKx30dsiIagvIFQFYUluiEULlCBVFEaMxjHH0Kw==
X-Received: by 2002:a05:6214:518f:b0:4bb:eef5:c870 with SMTP id kl15-20020a056214518f00b004bbeef5c870mr54148409qvb.66.1668108207673;
        Thu, 10 Nov 2022 11:23:27 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000:24f9:d5b6:38a7:110])
        by smtp.gmail.com with ESMTPSA id g26-20020ac8469a000000b003a5416da03csm29737qto.96.2022.11.10.11.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 11:23:27 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Vishnu.Banavath@arm.com,
	"abdellatif.elkhlifi@arm.com" <abdellatif.elkhlifi@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/3] Corstone-1000: 2022.11.10 RC: update the documentation
Date: Thu, 10 Nov 2022 14:23:15 -0500
Message-Id: <166810819627.1109422.8001248507621604099.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
References: <20221110154507.23779-1-abdellatif.elkhlifi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 10 Nov 2022 19:23:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4122

On Thu, 10 Nov 2022 15:45:04 +0000, abdellatif.elkhlifi@arm.com wrote:
> Updating the Corstone-1000 documentation for 2022.11.10 release candidate.
> 
> The commits are for master and langdale.
> 
> Cheers,
> Abdellatif
> 
> [...]

Applied, thanks!

[1/3] arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the user guide
      commit: 8185ca9c2098c4d3fd36e818a927cd1ee370a17f
[2/3] arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the release notes
      commit: 00ceaafc727106d51c1582b0084c2961e8d60911
[3/3] arm-bsp/documentation: corstone1000: 2022.11.10 RC: update the change log
      commit: ff9b6f29bf4a6e3fcead5c1025a413cffee7bc53

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

