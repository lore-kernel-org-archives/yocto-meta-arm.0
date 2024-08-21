Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C64C52D6F
	for <webhook@archiver.kernel.org>; Wed, 21 Aug 2024 07:02:42 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web10.14394.1724223751898752513
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 21 Aug 2024 00:02:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=oIWJkv7Z;
 spf=pass (domain: linaro.org, ip: 209.85.167.47, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52efa16aad9so7760756e87.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724223749; x=1724828549; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nLBVu78x5M43rbtnsF4YhT8E+8BFeTcPfh9Ss4Tv23s=;
        b=oIWJkv7ZeV0vxnfaU9fWUfW36ZFiHsM88sTWwhHmU5nR4UocvCW4OUql0IYY6DbGBF
         eR7TRkia7ylLeg9QXfqevFUxOclNBj0zAxqupX3FqHx4oaKnL6cYZPFZz6pgmaib6jNZ
         nV2p/KDY+TEYbOPd6Vb7a8gR/3Sqz9Ael06NolX1qB5K6AyTNxehenQWVIUB0SHYBfSl
         yKHLRMbZGC6ceCwavNXmFIZxKlNg/8+T1Wx3Xp5rI9N7DyvYRfbmRgGiX3Jeul0J/hqS
         VfxpskFu1BaZyzmoQ6muhRw4eXHWnHjRmx/bRANNp/7D68NkK38LSGWNuLyE1roEL+r5
         Ai7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724223749; x=1724828549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLBVu78x5M43rbtnsF4YhT8E+8BFeTcPfh9Ss4Tv23s=;
        b=woZOd+OJfExrfDEdwQI+kspkR2CSxfSsQKwbm1uSzIQSDz12Wp9Acg+HedTrdMhi10
         A8HGuEXsIBhFsAc/Ut5F7F8AXg197bYnY01AIiP6DzW+S2S00iQmk/CPEauUdDO41y2D
         8WvQInDKCsdxApUz3kadSMiyqOEB4hALzjxyMi4Fy6fcW2uiPBewinPkZnhbzkT2RqND
         pLYWlKK4RR+ccRGZiOISgovycAmyEKMlg8ovV6o2dBLcNUzyBkq49e7O166DcnB6d/27
         HEMzucGTjmj2eGveftRhqQOvloLnO3pOq/Z20YS7sPLIpDCFQDXELM/cJjAOOdKzvhmM
         4yug==
X-Gm-Message-State: AOJu0Yx9bvg7NCXfgmgBvQqDfwBichjJ7VPr4QQdTOYafA7kTmffYgV9
	qGMSBdfsQcCNWQISHs5LxTgQJUnwR0EJVHc1e67IifJxlyawRzm5ZY0Q5XP483Y=
X-Google-Smtp-Source: AGHT+IHqeXTRd+Ec1F6p/6CAFdk4vwhGfsPOovGJgTsMwki9azZZ2mULCtU4GEgbTXRUbOPoD9UDSQ==
X-Received: by 2002:a05:6512:b99:b0:530:ae99:c7fa with SMTP id 2adb3069b0e04-53348548becmr759819e87.10.1724223748768;
        Wed, 21 Aug 2024 00:02:28 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5330d42561csm1949646e87.299.2024.08.21.00.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:02:28 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:02:26 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Javier Tia <javier.tia@linaro.org>
Cc: meta-arm@lists.yoctoproject.org, Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH v2 14/14] qemuarm64-secureboot.yml: Set branch to
 scarthgap
Message-ID: <ZsWRAt4LHGd68rQT@nuoska>
References: <20240819190429.2897888-1-javier.tia@linaro.org>
 <20240819190429.2897888-15-javier.tia@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819190429.2897888-15-javier.tia@linaro.org>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 21 Aug 2024 07:02:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5984

Hi,

On Mon, Aug 19, 2024 at 01:04:29PM -0600, Javier Tia wrote:
> UEFI Secure Boot is broken in master. Set to the latest stable OE
> branch.

What exactly is broken on master? On my build with this series
everything worked with master commits:

poky 39de8c65492a8b84494abc3f890744f89af70a36
meta-arm c965cf722f684acfbefa5a6509d36c0478a7a48f
meta-openembedded ec936d6893b95a6c191c324ff2448444ac56d6dc
meta-secure-core ae48c2372a346eee842e94e0a230944977bc5293

$ kas build ci/qemuarm64-secureboot.yml:ci/sstate-mirror.yml:ci/testimage.yml
...
2024-08-21 07:45:38 - INFO     - RESULTS:
2024-08-21 07:45:38 - INFO     - RESULTS - ftpm.FtpmTestSuite.test_ftpm: PASSED (65.68s)
2024-08-21 07:45:38 - INFO     - RESULTS - optee.OpteeTestSuite.test_opteetest_xtest: PASSED (458.00s)
2024-08-21 07:45:38 - INFO     - RESULTS - uefi_secure_boot.UEFI_SB_TestSuite.test_uefi_secure_boot: PASSED (0.78s)
2024-08-21 07:45:38 - INFO     - RESULTS - date.DateTest.test_date: PASSED (11.95s)
2024-08-21 07:45:38 - INFO     - RESULTS - df.DfTest.test_df: PASSED (0.78s)
2024-08-21 07:45:38 - INFO     - RESULTS - oe_syslog.SyslogTest.test_syslog_running: PASSED (0.81s)
2024-08-21 07:45:38 - INFO     - RESULTS - oe_syslog.SyslogTestConfig.test_syslog_logger: PASSED (2.37s)
2024-08-21 07:45:38 - INFO     - RESULTS - oe_syslog.SyslogTestConfig.test_syslog_restart: PASSED (1.50s)
2024-08-21 07:45:38 - INFO     - RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
2024-08-21 07:45:38 - INFO     - RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (4.23s)
2024-08-21 07:45:38 - INFO     - RESULTS - ping.PingTest.test_ping: PASSED (0.05s)
2024-08-21 07:45:38 - INFO     - RESULTS - scp.ScpTest.test_scp_file: PASSED (1.88s)
2024-08-21 07:45:38 - INFO     - RESULTS - ssh.SSHTest.test_ssh: PASSED (0.73s)
2024-08-21 07:45:38 - INFO     - RESULTS - systemd.SystemdBasicTests.test_systemd_basic: PASSED (0.72s)
2024-08-21 07:45:38 - INFO     - RESULTS - systemd.SystemdBasicTests.test_systemd_failed: PASSED (1.64s)
2024-08-21 07:45:38 - INFO     - RESULTS - systemd.SystemdBasicTests.test_systemd_list: PASSED (5.84s)
2024-08-21 07:45:38 - INFO     - RESULTS - systemd.SystemdJournalTests.test_systemd_boot_time: PASSED (0.81s)
2024-08-21 07:45:38 - INFO     - RESULTS - systemd.SystemdJournalTests.test_systemd_journal: PASSED (0.97s)
2024-08-21 07:45:38 - INFO     - RESULTS - apt.AptRepoTest.test_apt_install_from_repo: SKIPPED (0.00s)
...
2024-08-21 07:45:38 - INFO     - SUMMARY:
2024-08-21 07:45:38 - INFO     - core-image-base () - Ran 75 tests in 561.638s
2024-08-21 07:45:38 - INFO     - core-image-base - OK - All required tests passed (successes=18, skipped=57, failures=0, errors=0)
2024-08-21 07:45:38 - INFO     - NOTE: recipe core-image-base-1.0-r0: task do_testimage: Succeeded

Cheers,

-Mikko

